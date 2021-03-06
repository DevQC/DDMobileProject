//
//  UIScrollView+PageStatus.h
//  
//
//  Created by nate on 16/7/22.
//  Copyright © 2016年 TonyLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"

typedef NS_ENUM(NSInteger,PageStatus) {
    
    PageStatusLoading,
    PageStatusError,
    PageStatusSucceed
};

typedef void(^EmptyViewTapBlock)();

@interface UIScrollView (PageStatus)<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

/**
 *  当前页面状态
 */
@property (nonatomic, assign) PageStatus currentPageStatus;

/**
 *  如果请求成功，空数据，显示标题提示
 */
@property (nonatomic, strong) NSString *succeedEmptyStr;
@property (nonatomic, strong) NSAttributedString *succeedEmptyAttributeStr;

/**
 *  如果请求成功，空数据，显示内容提示
 */
@property (nonatomic, strong) NSString *succeedEmptyDetailStr;
@property (nonatomic, strong) NSAttributedString *succeedEmptyAttributeStrDetailStr;

/**
 * 竖直方向偏移
 */
@property (nonatomic, assign) CGFloat verticalOffset;

/**
 * 元素竖直方向间距
 */
@property (nonatomic, assign) CGFloat verticalPadding;

/**
 *  如果请求成功，空数据，显示的图片
 */
@property (nonatomic ,strong) UIImage *succeedEmptyImage;

/**
 *  空页面点击，刷新block
 */
@property (nonatomic, copy) EmptyViewTapBlock emptyViewTapBlock;


/**
 * 重新加载按钮名称
 */
@property (nonatomic, strong) NSAttributedString *bottomButtonName;

/**
 *  重新加载按钮背景图片
 */
@property (nonatomic ,strong) UIImage *bottomButtonBgImage;


/**
 * 是否允许背景点击
 */
@property (nonatomic, assign) BOOL enableBgTap;


@end
