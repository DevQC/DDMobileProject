//
//  DDHomeViewController.m
//  DDMobileProject
//
//  Created by QJ_001 on 16/8/3.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import "DDHomeViewController.h"
#import "DDHomeSubViewController.h"
#import "RESideMenu.h"
#import "DDMapViewController.h"
#import "DDScanMenuViewController.h"
#import "DDPicMenuViewController.h"
#import "DDCustomNavController.h"

@interface DDHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    MBProgressHUD *_HUD;
}
@property (nonatomic,strong) DDTableView *tableView;
@property (nonatomic,strong) NSArray *itemArr;
@end

@implementation DDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
    staticStr = @"5669";
    NSLog(@"%@",staticStr);
    extern NSString *externStr1;
//    NSLog(@"%@",externStr1);
}

#pragma mark - lazy load

- (NSArray *)itemArr
{
    if (!_itemArr) {
        _itemArr = [NSArray arrayWithObjects:@"地图",@"图片",@"音频",@"视频",@"动画",@"二维码",@"多线程",@"JSPatch",@"Runlup",@"H5交互",@"提示框",@"自定义导航栏", nil];
    }
    return _itemArr;
}

#pragma mark - layoutUI

- (void)layoutUI
{
    if (!_tableView) {
        _tableView = [[DDTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0).with.insets(UIEdgeInsetsMake(0, 0, 50, 0));
        }];
        
    }
    
   MBProgressHUD *HUD = [MBProgressHUD showSystemIndicate];
    _HUD = HUD;
}

#pragma mark - TableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = self.itemArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_HUD hideAnimated:YES];
    switch (indexPath.row) {
        case 0:
        {
            DDMapViewController *mapVC = [[DDMapViewController alloc]init];
            [self.navigationController pushViewController:mapVC animated:YES];
        }
            break;
        case 1:
        {
            DDPicMenuViewController *picMenuVC = [[DDPicMenuViewController alloc]init];
            [self.navigationController pushViewController:picMenuVC animated:YES];
        }
            break;
        case 5:
        {
            DDScanMenuViewController *scanVC = [[DDScanMenuViewController alloc]init];
            [self.navigationController pushViewController:scanVC animated:YES];
        }
            break;
        case 11:
        {
            DDCustomNavController *scanVC = [[DDCustomNavController alloc]init];
            [self.navigationController pushViewController:scanVC animated:YES];
        }
            break;
        default:
        {
            DDHomeSubViewController *subVC = [[DDHomeSubViewController alloc]init];
            [self.navigationController pushViewController:subVC animated:YES];
        }
            break;
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 定制导航栏
-(NSMutableAttributedString*)setTitle
{
    NSString *titleStr=@"首页";
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:titleStr];
    [title addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x333333) range:NSMakeRange(0, title.length)];
    [title addAttribute:NSFontAttributeName value:CHINESE_SYSTEM(18) range:NSMakeRange(0, title.length)];
    
    return title;
}

-(UIButton*)set_leftButton
{
    UIButton *left_button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    [left_button setImage:[UIImage imageNamed:@"home_normal"] forState:UIControlStateNormal];
    [left_button setImageEdgeInsets:UIEdgeInsetsMake(0, -6, 0, 6)];
    return left_button;
    
}
-(void)left_button_event
{
    [self.sideMenuViewController presentLeftMenuViewController];
}

-(UIButton *)set_rightButton
{
    UIButton *right_button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    [right_button setImage:[UIImage imageNamed:@"home_normal"] forState:UIControlStateNormal];
    [right_button setImageEdgeInsets:UIEdgeInsetsMake(0, -6, 0, 6)];
    return right_button;
}

-(void)right_button_event:(UIButton *)sender
{
    [self.sideMenuViewController presentRightMenuViewController];
}


@end
