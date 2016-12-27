//
//  BaseApi.h
//  HZNetWork
//
//  Created by 郭凯 on 2016/12/26.
//  Copyright © 2016年 guokai. All rights reserved.

//  在这个类里做一些公共的事情，比如给每个请求参数添加时间戳

#import <Foundation/Foundation.h>
#import "HZNetworkConnection.h"

@interface BaseApi : NSObject

+ (void)sendPostRequestWithMethod:(NSString *)method parameters:(NSDictionary *)parameters callback:(Callback)callback;

+ (void)sendGetRequestWithMethod:(NSString *)method parameters:(NSDictionary *)parameters callback:(Callback)callback;

@end
