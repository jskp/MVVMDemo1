//
//  CustomTableViewCell.m
//  MVVMDemo1
//
//  Created by an on 17/6/1.
//  Copyright © 2017年 hua. All rights reserved.
//

#import "CustomTableViewCell.h"
@implementation CustomTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *messageLabel = [[UILabel alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:messageLabel];
        self.messageLabel = messageLabel;
    }
    return self;
}

+(CustomTableViewCell *)getTableViewCellWith:(UITableView *)tableView{
    static NSString * reuseIdentifier = @"reuseIdentifier";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    return cell;
    
}


@end
