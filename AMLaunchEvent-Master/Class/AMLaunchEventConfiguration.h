//
//  AMLaunchEventConfiguration.h
//  AMLaunchEvent
//
//  Created by AndyMu on 2017/9/19.
//  Copyright © 2017年 AndyMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMLaunchEventConfiguration : NSObject

/**
 等待请求相应时间(默认 1S)
 */
@property (nonatomic, assign) NSUInteger waitResponseDuration;


@end