//
//  BaseApi+Login.m
//  HZNetWork
//
//  Created by 郭凯 on 2016/12/26.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import "BaseApi+Login.h"
#define kRegisterLogin @"User/Register"

@implementation BaseApi (Login)

+ (void)LoginWithMobile:(NSString *)mobile verifyCode:(NSString *)verifyCode callback:(Callback)loginCallback {
    NSDictionary *params = @{@"mobile":mobile,@"validCode":verifyCode,@"os":@"iOS"};
    [BaseApi sendPostRequestWithMethod:kRegisterLogin parameters:params callback:loginCallback];

}

@end
