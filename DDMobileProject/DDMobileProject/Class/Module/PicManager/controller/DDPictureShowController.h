//
//  DDPictureShowController.h
//  DDMobileProject
//
//  Created by DevenChen on 2016/11/3.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import "DDBaseViewController.h"
#import "ImageToolDemoItem.h"
#import "YQImageTool.h"

@interface DDPictureShowController : DDBaseViewController

@property (nonatomic,strong) NSString *titleStr;

@property(nonatomic,strong)ImageToolDemoItem *item1;

@property(nonatomic,strong)ImageToolDemoItem *item2;

@property(nonatomic,strong)ImageToolDemoItem *item3;

@property(nonatomic,strong)ImageToolDemoItem *item4;

@property(nonatomic,strong)UIImage *bigIMG;

@property(nonatomic,strong)UIImage *normalIMG;

@property(nonatomic,strong)UIImage *maskIMG;

@end
