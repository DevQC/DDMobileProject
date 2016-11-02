//
//  MBProgressHUD+DDAdd.h
//  DDMobileProject
//
//  Created by QJ_001 on 16/9/20.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (DDAdd)


/**
 *  显示消息提示框
 *
 *  @param message 消息
 *  @param view    指定显示信息的view
 *
 *  @return 提示框
 */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;
/**
 *  显示成功信息提示框
 *
 *  @param success 成功信息
 */
+ (void)showSuccess:(NSString *)success;
/**
 *  显示失败信息提示框
 *
 *  @param success 失败信息
 */
+ (void)showError:(NSString *)error;
/**
 *  显示警告信息提示框
 *
 *  @param warn 警告信息
 */
+ (void)showWarn:(NSString *)warn;
/**
 *  显示无图信息提示框
 *
 *  @param warn无图信息
 */
+ (void)showMessage:(NSString *)message;
/**
 *  显示消息提示框
 *
 *  @param message 消息
 *
 *  @return 提示框
 */
+ (MBProgressHUD *)showLoading:(NSString *)message;
/**
 *  显示系统菊花
 *
 *  @return 提示框
 */
+ (MBProgressHUD *)showSystemIndicate;

/**
 *  隐藏提示框
 *
 *  @param view 指定隐藏提示框的view
 */
+ (void)hideHUDForView:(UIView *)view;
/**
 *  隐藏提示框
 */
+ (void)hideHUD;


@end
