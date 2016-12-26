//
//  HZNetworkConnection.h
//  HZNetWork
//
//  Created by 郭凯 on 2016/12/8.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZRequest.h"

typedef void(^Callback)(HZRequest *request);

@interface HZNetworkConnection : NSObject

- (void)sendPostRequestWithMethod:(NSString *)method parameters:(NSDictionary *)parameters callback:(Callback)callback;

- (void)sendGetRequestWithMethod:(NSString *)method parameters:(NSDictionary *)parameters callback:(Callback)callback;

@end
