//
//  CommonUtil.h
//  PlamExam
//
//  Created by 郭凯 on 16/10/12.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonUtil : NSObject

/**
 将字典转成按顺序排列（aa--zz）的字符串

 @param dict 传入一个字典

 @return 返回一个排过序的字符串
 */
+ (NSString *)JSONStringWithSortDictionary:(NSDictionary *)dict;

@end
