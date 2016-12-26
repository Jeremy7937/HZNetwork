//
//  BaseApi+Login.h
//  HZNetWork
//
//  Created by 郭凯 on 2016/12/26.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import "BaseApi.h"

@interface BaseApi (Login)

+ (void)LoginWithMobile:(NSString *)mobile verifyCode:(NSString *)verifyCode callback:(Callback)loginCallback;

@end
