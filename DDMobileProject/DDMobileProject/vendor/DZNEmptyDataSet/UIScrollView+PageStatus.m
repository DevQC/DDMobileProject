//
//  UIScrollView+PageStatus.m
//  催客网项目
//
//  Created by nate on 16/7/22.
//  Copyright © 2016年 TonyLi. All rights reserved.
//

#import "UIScrollView+PageStatus.h"
#import <objc/runtime.h>


static char const * const kCurrentPageStatus = "currentPageStatus";
static char const * const kSucceedEmptyStr  = "succeedEmptyStr";
static char const * const kEmptyViewTapBlock = "emptyViewTapBlock";
static char const * const kSucceedEmptyImage  = "succeedEmptyImage";

@implementation UIScrollView (PageStatus)

#pragma mark - life cycle

#pragma mark - private methods

#pragma mark - event response

#pragma mark - UITablViewDelegate

#pragma  mark - DZNEmptyDataSetDelegate

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSDictionary *attrsDic = @{
                               NSForegroundColorAttributeName: [UIColor blackColor],
                               NSFontAttributeName: [UIFont systemFontOfSize:18]
                               };
    if (self.currentPageStatus == PageStatusError) {
        return [[NSAttributedString alloc] initWithString:@"对不起,网络请求失败" attributes:attrsDic];
    } else if (self.currentPageStatus == PageStatusSucceed) {
        return [[NSAttributedString alloc] initWithString:self.succeedEmptyStr attributes:attrsDic];
    } else {
        return nil;
    }
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    if (self.currentPageStatus == PageStatusError) {
        return [UIImage imageNamed:@"netError"];
    } else if (self.currentPageStatus == PageStatusSucceed) {
        return self.succeedEmptyImage;
    } else {
        return [UIImage imageNamed:@"loading_imgBlue"];
    }
}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0) ];
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    if (self.emptyViewTapBlock) {
        self.emptyViewTapBlock();
    }
}

- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    return self.currentPageStatus == PageStatusLoading;
}

#pragma mark - getters / setters

- (void)setCurrentPageStatus:(PageStatus)currentPageStatus
{
    objc_setAssociatedObject(self, kCurrentPageStatus, @(currentPageStatus), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (PageStatus)currentPageStatus
{
    return [objc_getAssociatedObject(self, kCurrentPageStatus) integerValue];
}

- (void)setSucceedEmptyStr:(NSString *)succeedEmptyStr
{
    objc_setAssociatedObject(self, kSucceedEmptyStr, succeedEmptyStr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)succeedEmptyStr
{
    return objc_getAssociatedObject(self, kSucceedEmptyStr);
}

- (void)setEmptyViewTapBlock:(EmptyViewTapBlock)emptyViewTapBlock
{
    if (emptyViewTapBlock) {
        objc_setAssociatedObject(self, kEmptyViewTapBlock, emptyViewTapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (EmptyViewTapBlock)emptyViewTapBlock
{
    return objc_getAssociatedObject(self, kEmptyViewTapBlock);
}

- (void)setSucceedEmptyImage:(UIImage *)succeedEmptyImage {
    
    objc_setAssociatedObject(self, kSucceedEmptyImage, succeedEmptyImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)succeedEmptyImage {
    
    return objc_getAssociatedObject(self, kSucceedEmptyImage);
}




@end
