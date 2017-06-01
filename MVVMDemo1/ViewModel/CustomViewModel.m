//
//  CustomViewModel.m
//  MVVMDemo1
//
//  Created by an on 17/6/1.
//  Copyright © 2017年 hua. All rights reserved.
//

#import "CustomViewModel.h"
#import "CustomModel.h"
@implementation CustomViewModel
-(void)headerRefreshRequestWithCallback:(callBack)callBack{
    
    // 开个线程请求网络数据
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 模拟网络请求,在该线程睡眠2秒
        sleep(2);
        NSMutableArray *messageArray = [NSMutableArray array];
        for (int i=0; i<10; i++) {
            int x = arc4random() % 100;
            NSString *string=[NSString stringWithFormat:@"    (random%d) 你好我是阿振！",x];
            CustomModel *model=[[CustomModel alloc] init];
            model.title=string;
            [messageArray addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
           if (callBack) {
               callBack(messageArray);
           }
       });
    });
    
    
  }
-(void)footerRefreshRequestWithCallback:(callBack)callBack{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 模拟网络请求,在该线程睡眠2秒
        sleep(2);
        NSMutableArray *messageArray = [NSMutableArray array];
        for (int i=0; i<10; i++) {
            int x = arc4random() % 100;
            NSString *string=[NSString stringWithFormat:@"    (random%d) 你好我是阿振！",x];
            CustomModel *model=[[CustomModel alloc] init];
            model.title=string;
            [messageArray addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (callBack) {
                callBack(messageArray);
            }
        });
    });
    
    
}

@end
