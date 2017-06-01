//
//  MainViewController.m
//  MVVMDemo1
//
//  Created by an on 17/6/1.
//  Copyright © 2017年 hua. All rights reserved.
//

#import "MainViewController.h"
#import "TableViewProtocol.h"
#import "CustomViewModel.h"
#import "MJRefresh.h"
#import "Header.h"

@interface MainViewController ()
@property (nonatomic ,weak)UITableView *tableView;
@property (nonatomic ,strong)NSArray *messageArray;
@property (nonatomic ,strong)CustomViewModel *customViewModel;
@property (nonatomic ,strong)TableViewProtocol *tableViewProtocol;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"列表信息";
    self.customViewModel = [[CustomViewModel alloc] init];
    [self addUI];
}
-(void)addUI{
    
    if (iOS7) {
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    }

    // 添加 UITableView 并添加下拉和上拉的操作
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WScreen, HScreen-64) style:UITableViewStylePlain];
    __weak typeof(self)weakSelf = self;
    // 添加动画
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImages addObject:image];
    }
    MJRefreshGifHeader *gifHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    [gifHeader setImages:refreshingImages forState:MJRefreshStateRefreshing];
    tableView.mj_header = gifHeader;
    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreDate];
    }];
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:tableView];

    
    // 给 UITableView 添加代理
    TableViewProtocol *tableViewProtocol = [[TableViewProtocol alloc]init];
    tableView.dataSource = tableViewProtocol;
    tableView.delegate = tableViewProtocol;
    
    
    self.tableViewProtocol = tableViewProtocol;
    self.tableView = tableView;

    [self.tableView.mj_header beginRefreshing];
}
-(void)loadNewData{

    [self.customViewModel headerRefreshRequestWithCallback:^(NSArray *messageArry) {
        self.tableViewProtocol.messageArray = messageArry;
        self.messageArray = self.tableViewProtocol.messageArray;
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
        
    }];
    
}
-(void)loadMoreDate{
    [self.customViewModel footerRefreshRequestWithCallback:^(NSArray *messageArry) {
        NSMutableArray * mutableArray = [[NSMutableArray alloc] initWithArray:self.messageArray];
        [mutableArray addObjectsFromArray:messageArry];
        self.tableViewProtocol.messageArray = mutableArray;
        self.messageArray = mutableArray;
        [self.tableView.mj_footer endRefreshing];
        [self.tableView reloadData];
        
    }];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.tableView.mj_footer beginRefreshing];
}
@end
