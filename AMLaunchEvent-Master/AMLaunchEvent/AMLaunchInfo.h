//
//  AMLaunchInfo.h
//  AMLaunchEvent
//
//  Created by AndyMu on 2017/9/24.
//  Copyright © 2017年 AndyMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMLaunchInfo : NSObject

@property (nonatomic, strong) NSNumber *startTime; //开始时间
@property (nonatomic, strong) NSNumber *endTime; //结束时间
@property (nonatomic, assign) NSUInteger showTime; //显示时间
@property (nonatomic, copy) NSString *fileUrl; //资源下载地址
@property (nonatomic, strong) NSNumber *versionStamp; //启动页版本号

@property (nonatomic, copy) NSString *action;//native标示
@property (nonatomic, strong) NSNumber *openType;//打开方式
@property (nonatomic, assign) BOOL needLogin; //是否需要登录
@property (nonatomic, copy) NSString *redirectUrl;//点击URL

@end
