//
//  HZHTTPSessionManager.h
//  HZNetWork
//
//  Created by 郭凯 on 2016/12/8.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface HZHTTPSessionManager : AFHTTPSessionManager

+ (instancetype) shareManager;

@end
