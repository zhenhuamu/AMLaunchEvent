//
//  AMLaunchEvent.m
//  AMLaunchEvent
//
//  Created by AndyMu on 2017/9/17.
//  Copyright © 2017年 AndyMu. All rights reserved.
//

#import "AMLaunchEvent.h"

@implementation AMLaunchEvent

#pragma mark - Life Cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - Class Method

+ (instancetype)sharedLaunchEvent {
    static AMLaunchEvent* lanchEvent = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lanchEvent = [[AMLaunchEvent alloc] init];
    });
    return lanchEvent;
}

#pragma mark - SetupUI

UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
window.rootViewController = [XHLaunchAdController new];
window.rootViewController.view.backgroundColor = [UIColor clearColor];
window.rootViewController.view.userInteractionEnabled = NO;
window.windowLevel = UIWindowLevelStatusBar + 1;
window.hidden = NO;
window.alpha = 1;
self.window = window;
/** 添加launchImage */
[self.window addSubview:self.launchImageView];










@end
