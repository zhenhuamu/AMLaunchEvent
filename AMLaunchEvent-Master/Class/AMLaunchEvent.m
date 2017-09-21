//
//  AMLaunchEvent.m
//  AMLaunchEvent
//
//  Created by AndyMu on 2017/9/17.
//  Copyright © 2017年 AndyMu. All rights reserved.
//

#import "AMLaunchEvent.h"
#import "AMLaunchImage.h"
#import "AMLaunchWindow.h"

@interface AMLaunchEvent()

@property (nonatomic, strong) AMLaunchWindow *lauchWindow;

@end

@implementation AMLaunchEvent

#pragma mark - Life Cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupLaunchEvent];
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

#pragma mark - Public Method

+(void)setWaitDataDuration:(NSInteger )waitDataDuration type:(AMWaitType)type {
    
}

#pragma mark - SetupWindow

- (void)setupLaunchEvent {
    [[AMLaunchWindow serializer] addLaunchImage];
}

#pragma mark - Lazy








@end
