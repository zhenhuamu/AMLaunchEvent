//
//  AMLaunchEvent.m
//  AMLaunchEvent
//
//  Created by AndyMu on 2017/9/17.
//  Copyright © 2017年 AndyMu. All rights reserved.
//

#import "AMLaunchEvent.h"
#import <UIKit/UIKit.h>
#import "AMLauchImage.h"


@interface AMLaunchEvent()

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UIImageView *launchImageView;

@end

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

#pragma mark - SetupWindow

- (void)setupLaunchEvent {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [UIViewController new];
    window.rootViewController.view.backgroundColor = [UIColor clearColor];
    window.rootViewController.view.userInteractionEnabled = NO;
    window.windowLevel = UIWindowLevelStatusBar + 1;
    window.hidden = NO;
    window.alpha = 1;
    self.window = window;
    /** 添加launchImage */
    [self.window addSubview:self.launchImageView];
}


#pragma mark - Lazy

- (UIImageView *)launchImageView {
    if (!_launchImageView) {
        _launchImageView = [[UIImageView alloc]init];
        _launchImageView.frame = [UIScreen mainScreen].bounds;
        _launchImageView.userInteractionEnabled = YES;
        _launchImageView.image = [AMLauchImage serializer];
    }
    return _launchImageView;
}








@end
