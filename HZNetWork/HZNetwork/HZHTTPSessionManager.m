//
//  HZHTTPSessionManager.m
//  HZNetWork
//
//  Created by 郭凯 on 2016/12/8.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import "HZHTTPSessionManager.h"
#define BaseURLStr @"http://10.50.50.14:142/api/V3/"

@implementation HZHTTPSessionManager

static HZHTTPSessionManager *mgr = nil;

+ (instancetype)shareManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //根URL
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_0
        NSURL *baseURL = [NSURL URLWithString:[BaseURLStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
#else
        NSURL *baseURL = [NSURL URLWithString:[BaseURLStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
#endif
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        requestSerializer.timeoutInterval = 15;
        requestSerializer.stringEncoding = NSUTF8StringEncoding;
        
        AFHTTPResponseSerializer *respondSerializer = [AFJSONResponseSerializer serializer];
        
        mgr = [[HZHTTPSessionManager alloc] initWithBaseURL:baseURL sessionConfiguration:sessionConfig];
        mgr.requestSerializer = requestSerializer;
        mgr.responseSerializer = respondSerializer;
        
        //可以在这里支持https请求
        
    });
    
    return mgr;
}

@end
