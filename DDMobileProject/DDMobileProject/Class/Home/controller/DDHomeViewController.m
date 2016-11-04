//
//  DDHomeViewController.m
//  DDMobileProject
//
//  Created by QJ_001 on 16/8/3.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import "DDHomeViewController.h"
#import "RESideMenu.h"
#import "UITabBar+Badge.h"

@interface DDHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    MBProgressHUD *_HUD;
}
@property (nonatomic,strong) DDTableView *tableView;
@property (nonatomic,strong) NSArray *itemArr;
@property (nonatomic,strong) NSDictionary *dictData;
@end

@implementation DDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
    [self.tabBarController.tabBar showBadgeOnItemIndex:3];

}


#pragma mark - lazy load

- (NSArray *)itemArr
{
    if (!_itemArr) {
        _itemArr = [[NSArray alloc]init];
    }
    return _itemArr;
}

- (NSDictionary *)dictData
{
    if (!_dictData) {
        _dictData = @{@"地图":@"DDMapViewController",
                      @"图片":@"DDPicMenuViewController",
                      @"动画":@"DDHomeSubViewController",
                      @"二维码":@"DDScanMenuViewController",
                      @"音频":@"DDHomeSubViewController",
                      @"视频":@"DDHomeSubViewController",
                      @"多线程":@"DDGCDViewController",
                      @"JSPatch":@"DDHomeSubViewController",
                      @"Runlup":@"DDHomeSubViewController",
                      @"H5交互":@"DDHomeSubViewController",
                      @"提示框":@"DDHomeSubViewController",
                      @"自定义导航栏":@"DDCustomNavController",
                      @"空数据":@"DDEmptySetController"};

    }
    return _dictData;
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
    
//   MBProgressHUD *HUD = [MBProgressHUD showSystemIndicate];
//    _HUD = HUD;
}

#pragma mark - TableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dictData.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = self.dictData.allKeys[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = key;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [_HUD hideAnimated:YES];
    NSString *key = self.dictData.allKeys[indexPath.row];
    NSString *vc = self.dictData[key];
    UIViewController *subVc = [NSClassFromString(vc) new];
    [self.navigationController pushViewController:subVc animated:YES];
    

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
