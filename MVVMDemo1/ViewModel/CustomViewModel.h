//
//  CustomViewModel.h
//  MVVMDemo1
//
//  Created by an on 17/6/1.
//  Copyright © 2017年 hua. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^callBack)(NSArray *messageArry);
@interface CustomViewModel : NSObject
// 下拉刷新网络数据, block 回调
-(void)headerRefreshRequestWithCallback:(callBack)callBack;
// 上拉刷新网络数据, block 回调
-(void)footerRefreshRequestWithCallback:(callBack)callBack;
@end
