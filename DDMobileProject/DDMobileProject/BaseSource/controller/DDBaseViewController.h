//
//  DDBaseViewController.h
//  DDMobileProject
//
//  Created by QJ_001 on 16/8/3.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDTableView.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

@protocol  DDBaseViewControllerDataSource<NSObject>
@optional
-(NSInteger)numberOfLeft_buttons;
-(NSMutableAttributedString*)setTitle;
-(UIButton*)set_leftButton;
-(UIButton*)set_rightButton;
-(UIColor*)set_colorBackground;
-(CGFloat)set_navigationHeight;
-(UIView*)set_bottomView;
-(UIImage*)backgroundImage;
-(CGFloat)set_leftBarButtonItemVerticalPosition;
-(CGFloat)set_rightBarButtonItemVerticalPosition;
-(UIImage*)set_leftBarButtonItemWithImage;
-(UIImage*)set_rightBarButtonItemWithImage;
-(BOOL)showNavSeparateLine;
@end

@protocol DDBaseViewControllerDelegate <NSObject>
@optional
-(void)left_button_event;
-(void)right_button_event;
-(void)right_button_event:(UIButton*)sender;
-(void)title_click_event:(UIView*)sender;
@end

@interface DDBaseViewController : UIViewController<DDBaseViewControllerDataSource,DDBaseViewControllerDelegate>
@property(nonatomic, strong, readonly) UIPercentDrivenInteractiveTransition *interactivePopTransition;
@property(nonatomic, strong) UIView *snapshot;
-(void)set_Title:(NSMutableAttributedString *)title;
@end

