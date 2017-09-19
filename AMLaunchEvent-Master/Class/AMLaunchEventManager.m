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

@implementation AMLaunchEventManager

#pragma mark - Life Cycle

+ (void)load {
    [[self class] sharedManager];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        /*
         在UIApplicationDidFinishLaunching时初始化开屏广告,不建议这种方式。
         建议直接在AppDelegate didFinishLaunchingWithOptions中初始化。
         */
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            [self setupAMLaunchEvent];
        }];
    }
    return self;
}

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
    
}











@end
