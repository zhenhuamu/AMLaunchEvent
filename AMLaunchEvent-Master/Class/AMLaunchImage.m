//
//  AMLaunchImage.m
//  AMLaunchEvent
//
//  Created by AndyMu on 2017/9/18.
//  Copyright © 2017年 AndyMu. All rights reserved.
//

#import "AMLaunchImage.h"

static NSString * const kPortrait = @"Portrait";
static NSString * const kLandscape = @"Landscape";
static NSString * const kUILaunchImages = @"UILaunchImages";
static NSString * const kUILaunchImageSize = @"UILaunchImageSize";
static NSString * const kUILaunchImageOrientation = @"UILaunchImageOrientation";
static NSString * const kUILaunchImageName = @"UILaunchImageName";

@implementation AMLaunchImage

+ (instancetype)serializer {
    return [[self class] launchImage];
}

+ (AMLaunchImage *)launchImage {
    AMLaunchImage *pImage = [self launchImageWithType:kPortrait];
    if(pImage) return pImage;
    AMLaunchImage *lImage = [self launchImageWithType:kLandscape];
    if(lImage) return lImage;
    NSAssert(NO, @"%s LaunchImage is nil ", __func__);
    return nil;
}

+ (AMLaunchImage *)launchImageWithType:(NSString *)type {
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    NSString *viewOrientation = type;
    NSString *launchImageName = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:kUILaunchImages];
    for (NSDictionary* dict in imagesDict) {
        CGSize imageSize = CGSizeFromString(dict[kUILaunchImageSize]);
        if([viewOrientation isEqualToString:dict[kUILaunchImageOrientation]]) {
            if([dict[kUILaunchImageOrientation] isEqualToString:kLandscape]) {
                imageSize = CGSizeMake(imageSize.height, imageSize.width);
            }
            if(CGSizeEqualToSize(imageSize, viewSize)) {
                launchImageName = dict[kUILaunchImageName];
                AMLaunchImage *image = (AMLaunchImage *)[UIImage imageNamed:launchImageName];
                return image;
            }
        }
    }
    return nil;
}


@end
