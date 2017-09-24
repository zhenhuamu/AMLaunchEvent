//
//  AMLaunchEventManager.m
//  AMLaunchEvent
//
//  Created by AndyMu on 2017/9/17.
//  Copyright © 2017年 AndyMu. All rights reserved.
//

#import "AMLaunchEventManager.h"
#import "AppDelegate.h"
#import "AMLaunchEvent.h"
#import "AMLaunchInfo.h"


@implementation AMLaunchEventManager

#pragma mark - Life Cycle


#pragma mark - Class Method

+ (instancetype)sharedManager {
    static AMLaunchEventManager* eventManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        eventManager = [[AMLaunchEventManager alloc] init];
    });
    return eventManager;
}

#pragma mark -

- (void)setupAMLaunchEvent {
    /*
     设置发送请求得到相应的等待时间
     模式1：若在相应时间内无响应，则直接进入RootVC
     模式2：若在相应时间内无响应，检查本地缓存，有则显示，无则直接进入RootVC
     */
    [AMLaunchEvent setWaitResponceDuration:5 type:AMWaitTypeIntoVC];
    
    [self requestLaunchInfoWithcompletion:^(AMLaunchInfo * _Nullable launchInfo, NSError * _Nullable error) {
        if (launchInfo) {
            AMLaunchEventConfiguration * configuration = [[AMLaunchEventConfiguration alloc]init];
            configuration.startTime = launchInfo.startTime.doubleValue;
            configuration.endTime = launchInfo.endTime.doubleValue;
            configuration.showDuration = launchInfo.showTime;
            configuration.model = launchInfo;
            configuration.imageNameOrURLString = launchInfo.fileUrl;
            [AMLaunchEvent showEventWithEventConfiguration:configuration];
        }
    }];
}

#pragma mark - request

- (void)requestLaunchInfoWithcompletion:(nullable void (^)(AMLaunchInfo *_Nullable launchInfo, NSError *_Nullable error))completion {
    AMLaunchInfo *info = [[AMLaunchInfo alloc]init];
    info.startTime = @(1506238384000);
    info.endTime = @(1516238384000);
    info.showTime = 5;
    info.fileUrl = @"http://d.hiphotos.baidu.com/image/pic/item/f7246b600c3387444834846f580fd9f9d72aa034.jpg";
    info.versionStamp = @(1506238384000);
    info.action = @"1";
    info.openType = @(3);
    info.needLogin = YES;
    info.redirectUrl = @"https://www.baidu.com";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (completion) {
            completion (info, nil);
        }
    });
}









@end
