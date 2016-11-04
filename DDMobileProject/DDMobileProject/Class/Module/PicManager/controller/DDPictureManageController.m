//
//  DDPictureManageController.m
//  DDMobileProject
//
//  Created by DevenChen on 2016/11/3.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import "DDPictureManageController.h"

@interface DDPictureManageController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSDictionary *dictData;

@end

@implementation DDPictureManageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDictionary *)dictData
{
    if (!_dictData) {
        _dictData = @{@"得到带圆角的图片":@"DDPictureShowController",
                      @"获取缩略图":@"DDPictureShowController",
                      @"生成带水印的图片":@"DDPictureShowController",
                      @"裁剪图片":@"DDPictureShowController",
                      @"根据遮罩图形状裁剪":@"DDPictureShowController",
                      @"生成带阴影的图片":@"DDPictureShowController",
                      @"生成旋转的图片":@"DDPictureShowController",
                      @"UIView转图片":@"DDPictureShowController",
                      @"图片压缩":@"DDPictureShowController",
                      };
    }
    
    return _dictData;
}


- (void)layoutUI
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
        [_tableView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    
}

#pragma mark - TableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dictData.allKeys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.dictData.allKeys[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *key = self.dictData.allKeys[indexPath.row];
    NSString *stringVC = self.dictData[key];
    if (!stringVC.length) {
        return;
    }
    
    UIViewController *vc = [NSClassFromString(stringVC) new];
    [vc setValue:key forKey:@"titleStr"];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - 定制导航栏
-(NSMutableAttributedString*)setTitle
{
    NSString *titleStr=@"图片导航";
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:titleStr];
    [title addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x333333) range:NSMakeRange(0, title.length)];
    [title addAttribute:NSFontAttributeName value:CHINESE_SYSTEM(18) range:NSMakeRange(0, title.length)];
    
    return title;
}

@end
