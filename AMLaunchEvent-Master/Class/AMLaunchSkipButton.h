//
//  AMLaunchSkipButton.h
//  AMLaunchEvent
//
//  Created by AndyMu on 2017/9/24.
//  Copyright © 2017年 AndyMu. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  按钮类型
 */
typedef NS_ENUM(NSInteger,AMSkipButtonType) {
    
    AMSkipButtonTypeNone      = 1,//无
    AMSkipButtonTypeTime      = 2,//倒计时
    AMSkipButtonTypeText      = 3,//跳过
    AMSkipButtonTypeTimeText  = 4,//倒计时+跳过
    
};

@interface AMLaunchSkipButton : UIButton

@end
