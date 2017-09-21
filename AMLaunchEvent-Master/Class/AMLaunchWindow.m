//
//  AMLaunchWindow.m
//  AMLaunchEvent
//
//  Created by AndyMu on 2017/9/21.
//  Copyright © 2017年 AndyMu. All rights reserved.
//

#import "AMLaunchWindow.h"
#import "AMLaunchImage.h"

@implementation AMLaunchWindow

+ (instancetype)serializer {
    return [[self class] launchWindow];
}

+ (AMLaunchWindow *)launchWindow {
    AMLaunchWindow *window = (AMLaunchWindow *)[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [UIViewController new];
    window.rootViewController.view.backgroundColor = [UIColor clearColor];
    window.rootViewController.view.userInteractionEnabled = NO;
    window.windowLevel = UIWindowLevelStatusBar + 1;
    window.hidden = NO;
    window.alpha = 1.0f;
    return window;
}

- (void)addLaunchImage {
    UIImageView * launchImageView = [[UIImageView alloc]init];
    launchImageView.frame = [UIScreen mainScreen].bounds;
    launchImageView.userInteractionEnabled = YES;
    launchImageView.image = [AMLaunchImage serializer];
    [self addSubview:launchImageView];
}

@end
