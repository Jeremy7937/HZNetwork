//
//  BaseApi.h
//  HZNetWork
//
//  Created by 郭凯 on 2016/12/26.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZNetworkConnection.h"

@interface BaseApi : NSObject

+ (void)sendPostRequestWithMethod:(NSString *)method parameters:(NSDictionary *)parameters callback:(Callback)callback;

+ (void)sendGetRequestWithMethod:(NSString *)method parameters:(NSDictionary *)parameters callback:(Callback)callback;

@end
