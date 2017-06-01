//
//  TableViewProtocol.m
//  MVVMDemo1
//
//  Created by an on 17/6/1.
//  Copyright © 2017年 hua. All rights reserved.
//

#import "TableViewProtocol.h"
#import "CustomTableViewCell.h"
#import "CustomModel.h"
@implementation TableViewProtocol
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"_messageArray.count   >>   %lu",(unsigned long)_messageArray.count);
    return _messageArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTableViewCell *cell = [CustomTableViewCell getTableViewCellWith:tableView];
    cell.textLabel.text=((CustomModel *)[_messageArray objectAtIndex:indexPath.row]).title;
    return cell;
}
@end
