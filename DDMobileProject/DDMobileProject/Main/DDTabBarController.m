//
//  DDTabBarController.m
//  DDMobileProject
//
//  Created by QJ_001 on 16/8/3.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import "DDTabBarController.h"

#import "DDNavigationController.h"
#import "DDHomeViewController.h"
#import "DDDiscoverViewController.h"
#import "DDMoreViewController.h"
#import "DDMineViewController.h"


@interface DDTabBarController ()<UITabBarControllerDelegate>

@end

@implementation DDTabBarController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupTabBarController];
        self.tabBar.selectedImageTintColor =RGB(244, 213, 86);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma build home tabbar controller

- (void)setupTabBarController {
    /// 设置TabBar属性数组
    self.tabBarItemsAttributes = @[
                                   [self tabBarItemAttributeWithTitle:@"首页" imageName:@"home"],
                                   [self tabBarItemAttributeWithTitle:@"发现" imageName:@"message"],
                                   [self tabBarItemAttributeWithTitle:@"我的" imageName:@"account"],
                                   [self tabBarItemAttributeWithTitle:@"更多" imageName:@"mycity"],
                                   ];
    
    /// 设置控制器数组
    DDHomeViewController *homeVC = [[DDHomeViewController alloc]init];
    DDNavigationController* homeNav = [[DDNavigationController alloc] initWithRootViewController:homeVC];
    
    DDDiscoverViewController *disVC = [[DDDiscoverViewController alloc]init];
    DDNavigationController* disNav = [[DDNavigationController alloc] initWithRootViewController:disVC];
    
    DDMineViewController *mineVC = [[DDMineViewController alloc]init];
    DDNavigationController* mineNav = [[DDNavigationController alloc] initWithRootViewController:mineVC];
    
    DDMoreViewController *moreVC = [[DDMoreViewController alloc]init];
    DDNavigationController* moreNav = [[DDNavigationController alloc] initWithRootViewController:moreVC];
    
    moreNav.tabBarItem.badgeValue = @"";
    mineNav.tabBarItem.badgeValue = @"100";
    
    NSLog(@"%@",self.tabBar.subviews);
    
    self.viewControllers = @[homeNav,disNav,mineNav,moreNav];
    

    
    self.delegate = self;
    self.moreNavigationController.navigationBarHidden = YES;
}


- (NSDictionary*)tabBarItemAttributeWithTitle:(NSString*)title
                                 imageName:(NSString*)image {
    
    NSString* normalImg = [NSString stringWithFormat:@"%@_normal",image];
    NSString* highlightImg = [NSString stringWithFormat:@"%@_highlight",image];
    return @{
             CYLTabBarItemTitle         : title,
             CYLTabBarItemImage         : normalImg,
             CYLTabBarItemSelectedImage : highlightImg,
             };
}


#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController*)tabBarController shouldSelectViewController:(UINavigationController*)viewController {
    return YES;
}
@end
