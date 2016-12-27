//
//  BaseApi+BatchApi.m
//  HZNetWork
//
//  Created by 郭凯 on 2016/12/26.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import "BaseApi+BatchApi.h"
#define kMethod @"free/applications/free"
#define kSalesURL @"free/applications/sales"

@implementation BaseApi (BatchApi)

+ (void)requestFreeAndSalesWithPage:(NSInteger)page freeCallback:(Callback)freeCallback salesCallback:(Callback)salesCallback finish:(void (^)(BOOL))finish{
    NSDictionary *params = @{@"currency":@"rmb",@"page":@(page),@"category_id":@(0)};
    __block BOOL isAllSuccess = YES;
    
    dispatch_group_t group = dispatch_group_create();
    //请求免费限免接口
    dispatch_group_enter(group);  //如果是异步请求 需要手动管理group关联的block  enter() 和 leave() 要成对出现
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [BaseApi sendGetRequestWithMethod:kMethod parameters:params callback:^(HZRequest *request) {
            freeCallback(request);
            if (!request.requestResult) {
                isAllSuccess = NO;
            }
            
            dispatch_group_leave(group);
            
        }];
    });
    
    //请求sales接口
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [BaseApi sendGetRequestWithMethod:kSalesURL parameters:params callback:^(HZRequest *request) {
            salesCallback(request);
            if (!request.requestResult) {
                isAllSuccess = NO;
            }
            dispatch_group_leave(group);
        }];
    });
    
    //两个请求全部完成
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        finish(isAllSuccess);
    });
}

@end
