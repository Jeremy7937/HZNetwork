//
//  CommonUtil.m
//  PlamExam
//
//  Created by 郭凯 on 16/10/12.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import "CommonUtil.h"
#import "NSArray+Util.h"

@implementation CommonUtil

+ (NSString *)JSONStringWithSortDictionary:(NSDictionary *)dict
{
    
    NSArray *keys = [dict allKeys];
    NSArray *keySort=[keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [[(NSString *)obj1 lowercaseString] compare:[(NSString *)obj2 lowercaseString] options:NSNumericSearch];
    }];
    
    NSMutableString *jsonStr = [[NSMutableString alloc]initWithString:@"{"];
    
    for (NSString *key in keySort) {
        id value = [dict objectForKey:key];
        if ([value isKindOfClass:[NSString class]] ) {
            [jsonStr appendFormat:@"\"%@\":\"%@\",",key,value];
        }else if([value isKindOfClass:[NSNumber class]] ){
            [jsonStr appendFormat:@"\"%@\":%@,",key,value];
        }else if([value isKindOfClass:[NSArray class]]){
            [jsonStr appendFormat:@"\"%@\":%@,",key,[value ToJsonString]];
        }else{
            [jsonStr appendFormat:@"\"%@\":%@,",key,[self JSONStringWithSortDictionary:value]];
        }
    }
    [jsonStr replaceCharactersInRange:NSMakeRange(jsonStr.length - 1, 1) withString:@"}"];
    return jsonStr;
}

@end
