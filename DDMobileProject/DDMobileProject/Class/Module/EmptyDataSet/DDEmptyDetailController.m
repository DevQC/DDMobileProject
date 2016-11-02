//
//  DDEmptyDetailController.m
//  DDMobileProject
//
//  Created by DevenChen on 2016/11/2.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import "DDEmptyDetailController.h"

@interface DDEmptyDetailController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) NSInteger rowCount;

@end

@implementation DDEmptyDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
    [self configBlankView];
    
}

- (void)configBlankView
{
    self.tableView.emptyDataSetSource = self.tableView;//必须
    self.tableView.emptyDataSetDelegate = self.tableView;//必须
    self.tableView.currentPageStatus = self.pageStatus;//必须
    self.tableView.verticalOffset = 10;//非必须
    self.tableView.succeedEmptyImage = [UIImage imageNamed:@"nbls_yyyj_icon"];//非必须
    self.tableView.succeedEmptyStr = @"我成功了";//非必须
    self.tableView.enableBgTap = YES;//非必须
    self.tableView.bottomButtonName = [[NSAttributedString alloc] initWithString:@"重新加载"];
    NSAttributedString *attribute = [[NSAttributedString alloc] initWithString:@"加载成功" attributes:@{NSForegroundColorAttributeName:[UIColor redColor],
                                NSFontAttributeName: [UIFont systemFontOfSize:18]}];//非必须
    self.tableView.succeedEmptyAttributeStr = attribute;//非必须
    self.tableView.emptyViewTapBlock = ^{
        NSLog(@"我知道了");
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)layoutUI
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
    }
    
   
}


#pragma mark - TableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = @"我就测试";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}


#pragma mark - 定制导航栏
-(NSMutableAttributedString*)setTitle
{
    NSString *titleStr=@"空数据详情页面";
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:titleStr];
    [title addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x333333) range:NSMakeRange(0, title.length)];
    [title addAttribute:NSFontAttributeName value:CHINESE_SYSTEM(18) range:NSMakeRange(0, title.length)];
    
    return title;
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
    self.tableView.currentPageStatus = PageStatusLoading;
    self.rowCount = 2;
    [self.tableView reloadData];
}


@end
