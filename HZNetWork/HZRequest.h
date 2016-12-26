//
//  HZRequest.h
//  HZNetWork
//
//  Created by 郭凯 on 2016/12/26.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZRequest : NSObject

@property (nonatomic, copy)   NSString *urlPath;
@property (nonatomic, copy)   NSString *message;
@property (nonatomic, strong) id requestParam;
@property (nonatomic, strong) id dataModel;
@property (nonatomic, assign) BOOL requestResult;

@end
