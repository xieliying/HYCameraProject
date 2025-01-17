//
//  HYCameraHelper.m
//  HYCamera
//
//  Created by 谢立颖 on 2018/12/8.
//  Copyright © 2018 Viomi. All rights reserved.
//

#import "HYCameraHelper.h"

NSString * HYLocalizedString(NSString *key, NSString *comment)
{
    return [[[HYCameraHelper class] bundleForStrings] localizedStringForKey:key value:key table:@"Localizable"];
}

@implementation HYCameraHelper

+ (NSBundle *)hyCameraBundle {
    return [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"HYCamera" ofType:@"bundle"]];
}

+ (NSBundle *)bundleForStrings
{
    static NSBundle *bundle;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSBundle *bundleForClass = [NSBundle bundleForClass:[self class]];
        NSString *stringsBundlePath = [bundleForClass pathForResource:@"HYCamera" ofType:@"bundle"];
        bundle = [NSBundle bundleWithPath:stringsBundlePath] ?: bundleForClass;
    });
    
    return bundle;
}

@end

@implementation UIImage (Bundle)

+ (UIImage *)imageWithBundleAsset:(NSString *)assetName {
    NSBundle *timServerBundle = [HYCameraHelper hyCameraBundle];
    
    if (timServerBundle && assetName) {
        return [UIImage imageWithContentsOfFile:[[timServerBundle resourcePath] stringByAppendingPathComponent:[@"Images/" stringByAppendingString: assetName]]];
    } else {
        return nil;
    }
}

@end
