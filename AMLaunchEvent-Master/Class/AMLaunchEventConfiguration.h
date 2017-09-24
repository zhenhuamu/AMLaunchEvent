//
//  AMLaunchEventConfiguration.h
//  AMLaunchEvent
//
//  Created by AndyMu on 2017/9/19.
//  Copyright © 2017年 AndyMu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMLaunchSkipButton.h"

@interface AMLaunchEventConfiguration : NSObject

/**
 *  需要随图片一对一存储的点击事件
 */
@property (nonatomic, strong)id model;

/*----------------------------------------
 若不需要开始时间、结束时间则可以设置无穷大区间即可
-----------------------------------------*/
/**
 *  开始时间(活动开始)
 */
@property (nonatomic, assign) NSTimeInterval startTime;

/**
 *  结束时间(活动结束)
 */
@property (nonatomic, assign) NSTimeInterval endTime;

/**
 *  停留时间(default 5 ,单位:秒)
 */
@property (nonatomic, assign) NSUInteger showDuration;

/**
 *  image本地图片名(jpg/gif图片请带上扩展名)或网络图片URL string
 */
@property (nonatomic,copy) NSString *imageNameOrURLString;


@end
