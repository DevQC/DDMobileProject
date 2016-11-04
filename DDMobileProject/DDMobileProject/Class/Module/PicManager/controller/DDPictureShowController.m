//
//  DDPictureShowController.m
//  DDMobileProject
//
//  Created by DevenChen on 2016/11/3.
//  Copyright © 2016年 Deven. All rights reserved.
//

#import "DDPictureShowController.h"

@interface DDPictureShowController ()

@end

@implementation DDPictureShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self configView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --------LazyLoad
-(UIImage *)bigIMG{
    _bigIMG = (_bigIMG)?_bigIMG:[UIImage imageNamed:@"test"];
    return _bigIMG;
}

-(UIImage *)normalIMG{
    _normalIMG = (_normalIMG)?_normalIMG:[UIImage imageNamed:@"test1"];
    return _normalIMG;
}

-(UIImage *)maskIMG{
    _maskIMG = (_maskIMG)?_maskIMG:[UIImage imageNamed:@"mask"];
    return _maskIMG;
}


#pragma mark --------Functions
/**
 *  初始化
 */
-(void)setup{
    
    self.item1 = [[ImageToolDemoItem alloc]initWithFrame:CGRectMake(0,
                                                                    64,
                                                                    SCREEN_WIDTH/2-5,
                                                                    (SCREEN_HEIGHT-64-10)/2)];
    [self.view addSubview:self.item1];
    
    self.item2 = [[ImageToolDemoItem alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2+5,
                                                                    64,
                                                                    SCREEN_WIDTH/2-5,
                                                                    (SCREEN_HEIGHT-64-10)/2)];
    [self.view addSubview:self.item2];
    
    self.item3 = [[ImageToolDemoItem alloc]initWithFrame:CGRectMake(0,
                                                                    64+(SCREEN_HEIGHT-64-10)/2,
                                                                    SCREEN_WIDTH/2-5,
                                                                    (SCREEN_HEIGHT-64-10)/2)];
    [self.view addSubview:self.item3];
    
    self.item4 = [[ImageToolDemoItem alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2+5,
                                                                    64+(SCREEN_HEIGHT-64-10)/2,
                                                                    SCREEN_WIDTH/2-5,
                                                                    (SCREEN_HEIGHT-64-10)/2)];
    [self.view addSubview:self.item4];
}

- (void)configView
{
    if ([self.titleStr isEqualToString:@"得到带圆角的图片"]) {
        [self roundCorner];
    }
    
    if ([self.titleStr isEqualToString:@"获取缩略图"]) {
        [self snapView];
    }
    
    if ([self.titleStr isEqualToString:@"生成带水印的图片"]) {
        [self waterDirty];
    }
    
    if ([self.titleStr isEqualToString:@"裁剪图片"]) {
        [self cutView];
    }
    
    if ([self.titleStr isEqualToString:@"根据遮罩图形状裁剪"]) {
        [self maskView];
    }
    
    if ([self.titleStr isEqualToString:@"生成带阴影的图片"]) {
        [self shaddowView];
    }
    
    if ([self.titleStr isEqualToString:@"生成旋转的图片"]) {
        [self reloteView];
    }
    
    if ([self.titleStr isEqualToString:@"UIView转图片"]) {
        [self UIViewConvertToImage];
    }
    
    if ([self.titleStr isEqualToString:@"图片压缩"]) {
        [self compressImage];
    }
}

- (void)compressImage
{
    
}


- (void)UIViewConvertToImage
{
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0,
                                                            self.item1.IMGV.frame.size.width,
                                                            self.item1.IMGV.frame.size.width)];
    
    view1.backgroundColor = [UIColor whiteColor];
    view1.layer.cornerRadius = 20;
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(view1.bounds.size.width/2,
                                                            view1.bounds.size.width/2,
                                                            view1.bounds.size.width/2-20,
                                                            view1.bounds.size.width/2-20)];
    
    view2.backgroundColor = [UIColor orangeColor];
    view2.layer.shadowOffset = CGSizeMake(5, 5);
    view2.layer.shadowColor = [UIColor blackColor].CGColor;
    view2.layer.shadowRadius = 10;
    view2.layer.shadowOpacity = 0.8;
    
    UIImageView *IMGV = [[UIImageView alloc]initWithFrame:CGRectMake(100,
                                                                     100,
                                                                     view1.bounds.size.width/2-50,
                                                                     view1.bounds.size.width/2-50)];
    IMGV.contentMode = UIViewContentModeScaleAspectFill;
    IMGV.image = self.normalIMG;
    
    [view1 addSubview:view2];
    [view1 addSubview:IMGV];
    
    
    [self.item1.IMGV addSubview:view1];
    self.item1.titleStr.text = @"原UIView(有叠层)";
    
    self.item2.IMGV.image = [YQImageTool imageWithUIView:view1];
    self.item2.titleStr.text = @"生成图片";
    
    self.item3.hidden = YES;
    
    self.item4.IMGV.hidden = YES;

}


- (void)reloteView
{
    self.item1.IMGV.image = self.normalIMG;
    self.item1.titleStr.text = @"原图";
    
    self.item2.IMGV.image = [YQImageTool GetRotationImageWithImage:self.normalIMG Angle:45];
    self.item2.titleStr.text = @"旋转后的";
    
    self.item3.IMGV.image = [YQImageTool GetRotationImageWithImage:self.normalIMG Angle:90];
    self.item3.titleStr.text = @"旋转后的";
    
    
    self.item4.IMGV.image = [YQImageTool GetRotationImageWithImage:self.normalIMG Angle:120];
    self.item4.titleStr.text = @"旋转后的";
}

- (void)shaddowView
{
    //先处理一下原图,让效果更明显
    UIImage *oldIMG = [YQImageTool getCornerImageAtOriginalImageCornerWithImage:self.normalIMG
                                                                  andCornerWith:80
                                                             andBackGroundColor:[UIColor clearColor]];
    
    
    self.item1.IMGV.image = oldIMG;
    self.item1.titleStr.text = @"原图";
    
    self.item2.IMGV.image = [YQImageTool creatShadowImageWithOriginalImage:oldIMG
                                                           andShadowOffset:CGSizeMake(0, 0)
                                                              andBlurWidth:30
                                                                  andAlpha:1
                                                                  andColor:[UIColor yellowColor]];
    self.item2.titleStr.text = @"带阴影(黄色阴影)(无偏移)(带模糊)";
    
    self.item3.IMGV.image = [YQImageTool creatShadowImageWithOriginalImage:oldIMG
                                                           andShadowOffset:CGSizeMake(30, 30)
                                                              andBlurWidth:20
                                                                  andAlpha:1
                                                                  andColor:[UIColor whiteColor]];
    self.item3.titleStr.text = @"带阴影(白色阴影)(往右下方偏移)(带模糊)";
    
    
    self.item4.IMGV.image = [YQImageTool creatShadowImageWithOriginalImage:oldIMG
                                                           andShadowOffset:CGSizeMake(-30, -30)
                                                              andBlurWidth:0
                                                                  andAlpha:0.8
                                                                  andColor:[UIColor darkGrayColor]];
    self.item4.titleStr.text = @"带阴影(深灰色阴影)(往左上方偏移)(不带模糊)";
}

- (void)maskView
{
    //先把分辨率调一遍
    UIImage *oldIMG = [YQImageTool getThumbImageWithImage:self.normalIMG
                                                  andSize:self.maskIMG.size
                                                    Scale:NO];
    
    self.item1.IMGV.image = oldIMG;
    self.item1.titleStr.text = @"原图";
    
    self.item2.IMGV.image = self.maskIMG;
    self.item2.titleStr.text = @"遮罩图";
    
    self.item3.IMGV.image = [YQImageTool creatImageWithMaskImage:self.maskIMG andBackimage:oldIMG];
    self.item3.titleStr.text = @"生成的图片";
    
    
    self.item4.hidden = YES;

}

- (void)cutView
{
    self.item1.IMGV.image = self.bigIMG;
    self.item1.titleStr.text = @"原图";
    
    self.item2.IMGV.image = [YQImageTool cutImageWithImage:self.bigIMG
                                                   atPoint:CGPointMake(200,200)
                                                  withSize:CGSizeMake(1000, 1000)
                                           backgroundColor:[UIColor clearColor]];
    self.item2.titleStr.text = @"正常区域剪裁后";
    
    
    self.item3.IMGV.image = [YQImageTool cutImageWithImage:self.bigIMG
                                                   atPoint:CGPointMake(-400,
                                                                       -400)
                                                  withSize:CGSizeMake(1000, 1000)
                                           backgroundColor:[UIColor clearColor]];
    self.item3.titleStr.text = @"超范围区域剪裁后";
    
    self.item4.IMGV.image = [YQImageTool cutImageWithImage:self.bigIMG
                                                   atPoint:CGPointMake(-400,
                                                                       -400)
                                                  withSize:CGSizeMake(1000, 1000)
                                           backgroundColor:[UIColor yellowColor]];
    self.item4.titleStr.text = @"超范围区域剪裁,带背景色";
}

- (void)waterDirty
{
    self.item1.IMGV.image = self.normalIMG;
    self.item1.titleStr.text = @"原图";
    
    self.item2.IMGV.image = self.bigIMG;
    self.item2.titleStr.text = @"水印图";
    
    self.item3.IMGV.image = [YQImageTool GetWaterPrintedImageWithBackImage:self.normalIMG
                                                             andWaterImage:self.bigIMG
                                                                    inRect:CGRectMake(50,
                                                                                      50,
                                                                                      200,
                                                                                      200)
                                                                     alpha:0.6
                                                                waterScale:YES];
    self.item3.titleStr.text = @"参数waterScale为YES";
    
    
    self.item4.IMGV.image = [YQImageTool GetWaterPrintedImageWithBackImage:self.normalIMG
                                                             andWaterImage:self.bigIMG
                                                                    inRect:CGRectMake(50,
                                                                                      50,
                                                                                      200,
                                                                                      200)
                                                                     alpha:0.6
                                                                waterScale:NO];
    self.item4.titleStr.text = @"参数waterScale为NO";
}


- (void)roundCorner
{
    self.item1.IMGV.image = self.normalIMG;
    self.item1.titleStr.text = @"原图";
    
    self.item2.IMGV.image = [YQImageTool getCornerImageAtOriginalImageCornerWithImage:self.normalIMG
                                                                        andCornerWith:80
                                                                   andBackGroundColor:[UIColor clearColor]];
    self.item2.titleStr.text = @"直接在原图四周生成圆角";
    
    
    self.item3.IMGV.image = [YQImageTool getCornerImageFillSize:self.item3.IMGV.bounds.size
                                                      WithImage:self.normalIMG
                                                  andCornerWith:40
                                             andBackGroundColor:[UIColor clearColor]];
    self.item3.titleStr.text = @"根据Size生成圆角图片，图片会自适应填充";
    
    self.item4.IMGV.image = [YQImageTool getCornerImageFitSize:self.item3.IMGV.bounds.size
                                                     WithImage:self.normalIMG
                                                 andCornerWith:40
                                            andBackGroundColor:[UIColor clearColor]];
    self.item4.titleStr.text = @"根据Size生成圆角图片，图片会拉伸-变形";
}

- (void)snapView
{
    self.item1.IMGV.image = self.bigIMG;
    self.item1.titleStr.text = @"原图";
    
    self.item2.IMGV.image = [YQImageTool getThumbImageWithImage:self.bigIMG
                                                        andSize:self.item2.IMGV.frame.size
                                                          Scale:YES];
    self.item2.titleStr.text = @"参数Scale为YES";
    
    
    self.item3.IMGV.image = [YQImageTool getThumbImageWithImage:self.bigIMG
                                                        andSize:self.item3.IMGV.frame.size
                                                          Scale:NO];
    self.item3.titleStr.text = @"参数Scale为NO";
    
    self.item4.hidden = YES;

}

#pragma mark - 定制导航栏
-(NSMutableAttributedString*)setTitle
{
    NSString *titleStr=self.titleStr;
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:titleStr];
    [title addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x333333) range:NSMakeRange(0, title.length)];
    [title addAttribute:NSFontAttributeName value:CHINESE_SYSTEM(18) range:NSMakeRange(0, title.length)];
    
    return title;
}


@end
