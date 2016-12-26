//
//  NewsModel.h
//  HZNetWork
//
//  Created by 郭凯 on 2016/12/8.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
@property(nonatomic,assign)NSInteger Id;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *timeFormat;
@property(nonatomic,strong)NSString *descriptions;
@property(nonatomic,strong)NSString *imgFormat;

@end
