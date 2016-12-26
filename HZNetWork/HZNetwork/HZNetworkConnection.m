//
//  HZNetworkConnection.m
//  HZNetWork
//
//  Created by 郭凯 on 2016/12/8.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import "HZNetworkConnection.h"
#import "HZHTTPSessionManager.h"
#import "NSString+Util.h"
#import "CommonUtil.h"

#define HttpBasicKey @"HZ_PME_API_V1"
#define ApiSecret @"1!2@3#4$5%6^"

@interface HZNetworkConnection ()
@property (nonatomic, copy) Callback callback;
@end

@implementation HZNetworkConnection

- (NSString *)signStringWithDictionary:(NSDictionary *)params {
    [params setValue:ApiSecret forKey:@"secret"];
    NSString *signString =[CommonUtil JSONStringWithSortDictionary:params];
    signString=[signString lowercaseString];
    signString=[signString md532BitLower];
    signString=[NSString stringWithFormat:@"%@:%@",HttpBasicKey,signString];
    signString=[signString base64EncodedString];
    signString = [NSString stringWithFormat:@"Basic %@",signString];
    return signString;
}

- (void)sendPostRequestWithMethod:(NSString *)method parameters:(NSDictionary *)parameters callback:(Callback)callback {
 //   self.callback = callback;
    
    HZRequest *request = [[HZRequest alloc] init];
    request.requestParam = parameters;
    request.urlPath = method;
    
    HZHTTPSessionManager *mgr = [HZHTTPSessionManager shareManager];
    NSString *signStr = [self signStringWithDictionary:parameters];
    [mgr.requestSerializer setValue:signStr forHTTPHeaderField:@"Authorization"];
    [mgr POST:method parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSInteger code = [[responseObject objectForKey:@"Code"] integerValue];
        if (code > 0) {
            request.requestResult = YES;
            request.dataModel = [responseObject objectForKey:@"Data"];
            request.message = @"请求成功.";
        }else {
            request.requestResult = NO;
            request.message = [responseObject objectForKey:@"Message"];
            request.dataModel = nil;
        }
    
        if (callback) {
            callback(request);
        }
      //  self.callback = nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        request.requestResult = NO;
        request.dataModel = nil;
        request.message = @"网络异常，请重试";
        if (callback) {
            callback(request);
        }
      //  self.callback = nil;
    }];
}

- (void)sendGetRequestWithMethod:(NSString *)method parameters:(NSDictionary *)parameters callback:(Callback)callback {
    self.callback = callback;
    
    HZRequest *request = [[HZRequest alloc] init];
    request.requestParam = parameters;
    request.urlPath = method;
    
    HZHTTPSessionManager *mgr = [HZHTTPSessionManager shareManager];
    [mgr GET:method parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSInteger code = [[responseObject objectForKey:@"Code"] integerValue];
        if (code > 0) {
            request.requestResult = YES;
            request.dataModel = [responseObject objectForKey:@"Data"];
            request.message = @"请求成功.";
        }else {
            request.requestResult = NO;
            request.message = [responseObject objectForKey:@"Message"];
            request.dataModel = nil;
        }
        
        if (_callback) {
            _callback(request);
        }
        self.callback = nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        request.requestResult = NO;
        request.dataModel = nil;
        request.message = @"网络异常，请重试";
        
        if (_callback) {
            _callback(request);
        }
        self.callback = nil;
    }];
}

@end
