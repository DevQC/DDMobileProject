//
//  MBProgressHUD+DDAdd.m
//  DDMobileProject
//
//  Created by QJ_001 on 16/9/20.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import "MBProgressHUD+DDAdd.h"

@implementation MBProgressHUD (DDAdd)

#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    
    if (icon && icon.length) {
        // 设置图片
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
        // 再设置模式
        hud.mode = MBProgressHUDModeCustomView;
    }else{
        // 再设置模式
        hud.mode = MBProgressHUDModeText;
    }
    
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    //定制背景框颜色
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor blackColor];
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:1.0f];
}


#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor blackColor];

    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self show:success icon:@"成功图片" view:nil];
}

+ (void)showError:(NSString *)error
{
    [self show:error icon:@"报错图片" view:nil];
}

+ (void)showWarn:(NSString *)warn
{
    [self show:warn icon:@"警告图片" view:nil];
}

+ (void)showMessage:(NSString *)message
{
    [self show:message icon:nil view:nil];
}

+ (MBProgressHUD *)showLoading:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+ (MBProgressHUD *)showSystemIndicate
{
    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    hud.bezelView.backgroundColor = [UIColor yellowColor];
    hud.userInteractionEnabled = NO;
    return hud;
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

@end
