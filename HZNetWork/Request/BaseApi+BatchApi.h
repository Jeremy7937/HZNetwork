//
//  BaseApi+BatchApi.h
//  HZNetWork
//
//  Created by 郭凯 on 2016/12/26.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import "BaseApi.h"

@interface BaseApi (BatchApi)

+ (void)requestFreeAndSalesWithPage:(NSInteger)page freeCallback:(Callback)freeCallback salesCallback:(Callback)salesCallback finish:(void(^)(BOOL isAllSuccess))finish;

@end
