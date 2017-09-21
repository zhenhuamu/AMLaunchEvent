//
//  AMLaunchEvent.h
//  AMLaunchEvent
//
//  Created by AndyMu on 2017/9/17.
//  Copyright © 2017年 AndyMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  等待请求相应事件
 */
typedef NS_ENUM(NSInteger , AMWaitType) {
    /**
     *  无响应直接进入RootVC
     */
    AMWaitTypeIntoVC = 1,
    /**
     *  无响应检查本地缓存，有则显示，无则直接进入RootVC
     */
    AMWaitTypeCheckCache = 2,
};

NS_ASSUME_NONNULL_BEGIN

@interface AMLaunchEvent : NSObject

/**
 *  设置等待请求相应时间(default 1)
 */
+(void)setWaitResponceDuration:(NSInteger )waitResponceDuration type:(AMWaitType)type;

@end

NS_ASSUME_NONNULL_END
