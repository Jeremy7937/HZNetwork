//
//  ViewController.m
//  HZNetWork
//
//  Created by 郭凯 on 2016/12/8.
//  Copyright © 2016年 guokai. All rights reserved.
//

#import "ViewController.h"
#import "BaseApi+Login.h"
#import "BaseApi+BatchApi.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)requestData:(id)sender {
    [self loginRequest];
}

- (void)batchRequest {
    
    [BaseApi requestFreeAndSalesWithPage:2 freeCallback:^(HZRequest *request) {
        NSLog(@"_____免费限免请求结束。。");
        NSLog(@"error : %@",request.message);
        NSLog(@"result: %@",request.dataModel);
    } salesCallback:^(HZRequest *request) {
        NSLog(@"_____出售限免请求结束。。");
        NSLog(@"error : %@",request.message);
        NSLog(@"result: %@",request.dataModel);
    } finish:^(BOOL isAllSuccess) {
         NSLog(@"_____两个都请求结束。。");
    }];
}

- (void)loginRequest {
    //accountID: 06c8b1f9-666f-48b8-8188-de3030651638
    [BaseApi LoginWithMobile:@"18301718531" verifyCode:@"1111" callback:^(HZRequest *request) {
        if (request.requestResult) {
            NSLog(@"result: %@",request.dataModel);
        }else {
            NSLog(@"errorMessage: %@",request.message);
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
