//
//  DDNavigationController.m
//  DDMobileProject
//
//  Created by QJ_001 on 16/8/3.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import "DDNavigationController.h"
#import "DDTabBarController.h"

@interface DDNavigationController ()

@end

@implementation DDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // fix strange animate when use `-[UIViewController cyl_jumpToOtherTabBarControllerItem:(Class)ClassType performSelector:arguments:returnValue:]` ,like this http://i63.tinypic.com/bg766g.jpg . If you have not used this method delete this line blow.
    [(DDTabBarController *)self.tabBarController rootWindow].backgroundColor = [UIColor whiteColor];
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark 一个类只会调用一次
+ (void)initialize
{
    // 1.取出设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    navBar.tintColor = HEXCOLOR(0x333333);
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    UIImage *backButtonImage = [[UIImage imageNamed:@"nav_back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    [barItem setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [navBar setShadowImage:[[UIImage alloc] init]];
    // 3.设置导航栏标题颜色为白色
    
    [navBar setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName : HEXCOLOR(0x333333),
                                     NSFontAttributeName:CHINESE_SYSTEM(18)
                                     }];
    
    // 4.设置导航栏按钮文字颜色为白色
    [barItem setTitleTextAttributes:@{
                                      NSForegroundColorAttributeName : HEXCOLOR(0xffae00),
                                      NSFontAttributeName : [UIFont systemFontOfSize:14]
                                      } forState:UIControlStateNormal];
    
    
}


@end
