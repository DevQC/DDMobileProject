//
//  UITabBar+Badge.h
//  DDMobileProject
//
//  Created by DevenChen on 2016/11/4.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)

- (void)showBadgeOnItemIndex:(int)index;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点

@end
