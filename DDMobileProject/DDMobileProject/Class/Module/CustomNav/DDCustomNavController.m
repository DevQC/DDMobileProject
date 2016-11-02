//
//  DDCustomNavController.m
//  DDMobileProject
//
//  Created by DevenChen on 16/10/17.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import "DDCustomNavController.h"

@interface DDCustomNavController ()

@end

@implementation DDCustomNavController

- (void)viewDidLoad {
    [super viewDidLoad];
//     self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor blueColor];
    self.title = @"测试";
//    self.navigationController.navigationBarHidden = YES;
       
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor*)set_colorBackground
{
    return [UIColor redColor];
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
