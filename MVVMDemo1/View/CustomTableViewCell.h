//
//  CustomTableViewCell.h
//  MVVMDemo1
//
//  Created by an on 17/6/1.
//  Copyright © 2017年 hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property(nonatomic ,weak)UILabel *messageLabel;
+(CustomTableViewCell *)getTableViewCellWith:(UITableView *)tableView;
@end
