//
//  AMLaunchEventManager.h
//  AMLaunchEvent
//
//  Created by AndyMu on 2017/9/17.
//  Copyright © 2017年 AndyMu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMLaunchEventManager : NSObject

+ (instancetype)sharedManager;

- (void)setupAMLaunchEvent;

@end

NS_ASSUME_NONNULL_END
