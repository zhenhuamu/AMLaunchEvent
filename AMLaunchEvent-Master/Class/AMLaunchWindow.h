//
//  AMLaunchWindow.h
//  AMLaunchEvent
//
//  Created by AndyMu on 2017/9/21.
//  Copyright © 2017年 AndyMu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMLaunchWindow : UIWindow

/**
 Creates and returns a serializer with default LauchWindow.
 */
+ (instancetype)serializer;

- (void)addLaunchImage;

@end
