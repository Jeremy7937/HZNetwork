//
//  BaseApi.m
//  HZNetWork
//
//  Created by 郭凯 on 2016/12/26.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import "BaseApi.h"

@implementation BaseApi

+ (void)sendPostRequestWithMethod:(NSString *)method parameters:(NSDictionary *)parameters callback:(Callback)callback {
    
    NSMutableDictionary *postDic = [[NSMutableDictionary alloc] initWithDictionary:parameters];
    [postDic setValue:[NSString stringWithFormat:@"%ld",(NSInteger)[[NSDate date] timeIntervalSince1970]] forKey:@"timespan"];
    
    HZNetworkConnection *connection = [[HZNetworkConnection alloc] init];
    [connection sendPostRequestWithMethod:method parameters:postDic callback:callback];
}

+ (void)sendGetRequestWithMethod:(NSString *)method parameters:(NSDictionary *)parameters callback:(Callback)callback {
    HZNetworkConnection *connection = [[HZNetworkConnection alloc] init];
    [connection sendGetRequestWithMethod:method parameters:parameters callback:callback];
}

@end
