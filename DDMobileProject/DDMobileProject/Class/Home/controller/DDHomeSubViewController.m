//
//  DDHomeSubViewController.m
//  DDMobileProject
//
//  Created by QJ_001 on 16/8/3.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import "DDHomeSubViewController.h"
NSString *externStr1 = @"extern12";
@interface DDHomeSubViewController ()

@end

@implementation DDHomeSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBar.translucent = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
//    [self.view addSubview:imageV];
    UIImage *image1 = [UIImage imageNamed:@"加载中-帧1"];
    UIImage *image2 = [UIImage imageNamed:@"加载中-帧2"];
    imageV.animationImages = @[image1,image2];
    imageV.animationDuration = 0.5;
    [imageV startAnimating];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = imageV;
    hud.label.text = @"加载中...";


    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
