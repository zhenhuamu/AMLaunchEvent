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
#import "AMLaunchEventConfiguration.h"
#import "AMLaunchEventImageView.h"

#define DISPATCH_SOURCE_CANCEL_SAFE(time) if(time)\
{\
dispatch_source_cancel(time);\
time = nil;\
}


static NSUInteger const defaultWaitResponceDuration = 1;
static NSTimeInterval const defaultWindowRemoveDuration = 0.3;



@interface AMLaunchEvent()

@property (nonatomic, strong) AMLaunchWindow *lauchWindow;
@property (nonatomic, strong) AMLaunchEventImageView *eventImageView;
@property (nonatomic, assign) NSUInteger waitResponceDuration;
@property (nonatomic, assign) AMWaitType waitType;
@property (nonatomic, strong) dispatch_source_t waitResponceTimer;
@property (nonatomic, strong) AMLaunchEventConfiguration *configuration;


@end

@implementation AMLaunchEvent

#pragma mark - Life Cycle


#pragma mark - Class Method

+ (instancetype)sharedLaunchEvent {
    static AMLaunchEvent* lanchEvent = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lanchEvent = [[AMLaunchEvent alloc] init];
    });
    return lanchEvent;
}

#pragma mark - Private Method

- (void)waitResponce {
    //TODO:检查本地缓存，有则显示，实现
    __block NSUInteger duration = _waitResponceDuration ?: defaultWaitResponceDuration;
    NSTimeInterval period = 1;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _waitResponceTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_waitResponceTimer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_waitResponceTimer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if(duration==0) {
                DISPATCH_SOURCE_CANCEL_SAFE(_waitResponceTimer);
                (_waitType == AMWaitTypeIntoVC) ? [self removeLaunchWindow] : nil;
                return;
            }
            duration--;
        });
    });
    
    dispatch_resume(_waitResponceTimer);
}

#pragma mark - Public Method

+ (AMLaunchEvent *)setWaitResponceDuration:(NSUInteger )waitResponceDuration type:(AMWaitType)type {
    AMLaunchEvent *launchEvent = [AMLaunchEvent sharedLaunchEvent];
    [launchEvent setupLaunchWindow];
    launchEvent.waitResponceDuration = waitResponceDuration;
    launchEvent.waitType = type;
    //TODO:检查本地缓存，有则显示， 实现
    waitResponceDuration >0 ? [launchEvent waitResponce] : nil;
    return launchEvent;
}

+ (AMLaunchEvent *)showEventWithEventConfiguration:(AMLaunchEventConfiguration *)eventConfiguration {
    AMLaunchEvent *launchEvent = [AMLaunchEvent sharedLaunchEvent];
    if (launchEvent.lauchWindow) {
        launchEvent.configuration = eventConfiguration;
        [launchEvent setupLaunchEventImage];
    }else {
        //TODO:检查本地缓存，有则显示， 实现
    }
    return launchEvent;
}

#pragma mark - SetupWindow

- (void)setupLaunchWindow {
    self.lauchWindow = [AMLaunchWindow serializer];
    [self.lauchWindow addLaunchImage];
}

#pragma mark - RemoveWindow

- (void)removeLaunchWindow {
    [UIView animateWithDuration:defaultWindowRemoveDuration animations:^{
        self.lauchWindow.alpha = 0;
    } completion:^(BOOL finished) {
        [self launchWindowRemove];
    }];
}

- (void)launchWindowRemove {
    DISPATCH_SOURCE_CANCEL_SAFE(_waitResponceTimer);
    self.lauchWindow.hidden = YES;
    self.lauchWindow = nil;
}


#pragma mark - SetupEvent

- (void)setupLaunchEventImage {

}

#pragma mark - Lazy








@end
