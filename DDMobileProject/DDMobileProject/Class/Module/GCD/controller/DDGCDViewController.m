//
//  DDGCDViewController.m
//  DDMobileProject
//
//  Created by DevenChen on 2016/11/4.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import "DDGCDViewController.h"

@interface DDGCDViewController ()

@end

@implementation DDGCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 定制导航栏
-(NSMutableAttributedString*)setTitle
{
    NSString *titleStr=@"CGD导航";
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:titleStr];
    [title addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x333333) range:NSMakeRange(0, title.length)];
    [title addAttribute:NSFontAttributeName value:CHINESE_SYSTEM(18) range:NSMakeRange(0, title.length)];
    
    return title;
}

@end
