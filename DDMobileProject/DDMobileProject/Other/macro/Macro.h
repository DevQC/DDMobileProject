//
//  Macro.h
//  DDMobileProject
//
//  Created by QJ_001 on 16/8/3.
//  Copyright © 2016年 Deven. All rights reserved.
//

#ifndef Macro_h
#define Macro_h


///--------
/// 升级信息
///--------
#if Product || AppStore
#define kVersionCode  @"11"  // 版本号
#define kCurChannel  @"zxpt"
#define kCHANNEL @"appstore"
#define kApiVersion @"1.0.0"
#else
#define kVersionCode  @"11"
#define kCurChannel  @"zxpt"
#define kCHANNEL @"appstore"
#define kApiVersion @"1.0.0"
#endif

///------
/// NSLog
///------

#define LogError(...) DDLogError(__VA_ARGS__)




#define UNICODETOUTF16(x) (((((x - 0x10000) >>10) | 0xD800) << 16)  | (((x-0x10000)&3FF) | 0xDC00))
#define MULITTHREEBYTEUTF16TOUNICODE(x,y) (((((x ^ 0xD800) << 2) | ((y ^ 0xDC00) >> 8)) << 8) | ((y ^ 0xDC00) & 0xFF)) + 0x10000

// App Frame Height&Width
#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width
#define kKeyWindow [UIApplication sharedApplication].keyWindow

//获取View的属性
#define GetViewWidth(view)  view.frame.size.width
#define GetViewHeight(view) view.frame.size.height
#define GetViewX(view)      view.frame.origin.x
#define GetViewY(view)      view.frame.origin.y

// MainScreen Height&Width
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

// MainScreen bounds
#define Main_Screen_Bounds [[UIScreen mainScreen] bounds]
#define SIZE_PORTION  SCREEN_WIDTH/320

//导航栏高度
#define TopBarHeight 64.5
#define STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
/// 状态栏高度
#define STATUS_BAR_HEIGHT 20
/// NavBar高度
#define NAVIGATION_BAR_HEIGHT 44
/// 状态栏 ＋ 导航栏 高度
#define STATUS_AND_NAVIGATION_HEIGHT ((STATUS_BAR_HEIGHT) + (NAVIGATION_BAR_HEIGHT))

// 字体大小(常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

// 当前版本
#define FSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SSystemVersion          ([[UIDevice currentDevice] systemVersion])

// 是否大于IOS7
#define isIOS7                  ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0)
// 是否IOS6
#define isIOS6                  ([[[UIDevice currentDevice]systemVersion]floatValue] < 7.0)
// 是否大于IOS8
#define isIOS8                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=8.0)
// 是否大于IOS9
#define isIOS9                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=9.0)


//判断是否 Retina屏、设备是否iPhone 5、是否是iPad
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/** 判断是否为iPhone */
#define isiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

/** 判断是否是iPad */
#define isiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** 判断是否为iPod */
#define isiPod ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

/** 设备是否为iPhone 4/4S 分辨率320x480，像素640x960，@2x */
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 5C/5/5S 分辨率320x568，像素640x1136，@2x */
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6 分辨率375x667，像素750x1334，@2x */
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6 Plus 分辨率414x736，像素1242x2208，@3x */
#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)



// 是否空对象
#define IS_NULL_CLASS(OBJECT) [OBJECT isKindOfClass:[NSNull class]]

//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

#define COLOR_RGB(rgbValue,a) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00)>>8))/255.0 blue: ((float)((rgbValue) & 0xFF))/255.0 alpha:(a)]

//常用色值
#define LINE_COLOR HEXCOLOR(0xe5e5e5)
#define PAGE_BACKGROUND_COLOR RGB(242,242,242)
#define COLOR_WORD_BLACK  HEXCOLOR(0x333333)
#define COLOR_WORD_GRAY_1  HEXCOLOR(0x666666)
#define COLOR_WORD_GRAY_2  HEXCOLOR(0x999999)
#define COLOR_WORD_GRAY_3  HEXCOLOR(0xcccccc)
#define COLOR_Navigation_BackGround HEXCOLOR(0xd23f3f)
#define COLOR_Navigation_BLUEBackGround HEXCOLOR(0x3bcceb)

///中文字体
#define CHINESE_FONT_NAME  @"Heiti SC"
#define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]
///英文跟数字的字体
#define ENGLISH_NUMBER_FONT_NAME  @"Helvetica Neue"
#define ENGLISH_SYSTEM(x) [UIFont fontWithName:ENGLISH_NUMBER_FONT_NAME size:x]

//int转换成String
#define intToStr(S)    [NSString stringWithFormat:@"%d",S]

//App版本
//#define ZU_APP_STORE_URL        @"https://itunes.apple.com/cn/app/id"ZU_APP_ID"?mt=8"
//#define ZU_APP_STORE_REVIEW_URL @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id="ZU_APP_ID@"&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software"

#define ZU_APP_NAME    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"])
#define ZU_APP_VERSION ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define ZU_APP_BUILD   ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])

//AppDelegate对象
#define AppDelegateInstance [[UIApplication sharedApplication] delegate]

//获取图片资源
#define GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

//在Main线程上运行
#define DISPATCH_ON_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//不同屏幕尺寸字体适配
#define kScreenWidthRatio  (SCREEN_WIDTH / 320.0)
#define kScreenHeightRatio (SCREEN_HEIGHT / 568.0)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define AdaptedSize(x)   ceilf((x) * kScreenWidthRatio)
#define kFontSize(R)     CHINESE_SYSTEM(AdaptedWidth(R))

//在Global Queue上运行
#define DISPATCH_ON_GLOBAL_QUEUE_HIGH(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_DEFAULT(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_LOW(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_BACKGROUND(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), globalQueueBlocl);

//Global Queue
//DISPATCH_ON_GLOBAL_QUEUE_DEFAULT(^{
//异步耗时任务
//})


///------------
/// NotifycationCenter
///------------

#define KDISCOVER_NOTIFY  @"DiscoverRefreshNofify"

//上传报价图--通知保存已上传图片
#define OFFER_SAVE_ALREADY_IMAGE_NOTIFICATION  @"OFFER_SAVE_ALREADY_IMAGE_NOTIFICATION"
//上传报价图--通知删除图片
#define OFFER_DELETE_ALREADY_IMAGE_NOTIFICATION  @"OFFER_DELETE_ALREADY_IMAGE_NOTIFICATION"

//家-通知是否展示操作提示
#define ZUMYHOME_TIP_SHOW_NOTIFICATION @"ZUMYHOME_TIP_SHOW_NOTIFICATION"

///------------
/// AppDelegate
///------------

#define DDSharedAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

//最大的上传图片张数
#define updateMaximumNumberOfImage 12

#endif /* Macro_h */
