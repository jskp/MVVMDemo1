//
//  TableViewProtocol.h
//  MVVMDemo1
//
//  Created by an on 17/6/1.
//  Copyright © 2017年 hua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TableViewProtocol : NSObject<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)NSArray *messageArray;
@end
