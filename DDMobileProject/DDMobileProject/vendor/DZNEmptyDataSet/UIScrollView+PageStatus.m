//
//  UIScrollView+PageStatus.m
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
static char const * const kSucceedEmptyDetailStr = "succeedEmptyDetailStr";
static char const * const kSucceedEmptyDetailAttributeStr = "succeedEmptyAttributeStrDetailStr";
static char const * const kSucceedEmptyAttributeStr = "succeedEmptyAttributeStr";
static char const * const kverticalOffset = "verticalOffset";
static char const * const kverticalPadding = "verticalPadding";
static char const * const kBottomButtonName = "bottomButtonName";
static char const * const kBottomButtonBgImage = "bottomButtonBgImage";
static char const * const kEnableBgTap = "enableBgTap";

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
    
    switch (self.currentPageStatus) {
        case PageStatusError:
            return [[NSAttributedString alloc] initWithString:@"加载失败，请稍后再试" attributes:attrsDic];
            break;
        case PageStatusSucceed:
        {
            if (self.succeedEmptyAttributeStr) {
                return self.succeedEmptyAttributeStr;
            }
            return [[NSAttributedString alloc] initWithString:self.succeedEmptyStr.length?self.succeedEmptyStr:@"暂无数据" attributes:attrsDic];
        }
            break;
        default:
            return nil;
            
    }
    
    
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    
    switch (self.currentPageStatus) {
        case PageStatusSucceed:
        {
            if (self.succeedEmptyAttributeStrDetailStr) {
                return self.succeedEmptyAttributeStrDetailStr;
            }
            return nil;
        }
            break;
        default:
            return nil;
            
    }

}


- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    
    switch (self.currentPageStatus) {
        case PageStatusError:
            return [UIImage imageNamed:@"bls_no_chatlist_icon"];
            break;
        case PageStatusSucceed:
        {
            if (self.succeedEmptyImage) {
                return self.succeedEmptyImage;
            }
            return [UIImage imageNamed:@"bls_no_chatlist_icon"];
        }
            break;
        default:
            return nil;
            
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
    if (self.emptyViewTapBlock && self.enableBgTap) {
        self.emptyViewTapBlock();
    }
}

- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    return self.currentPageStatus == PageStatusLoading;
}


- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    if (self.verticalPadding) {
        return self.verticalPadding;
    }
    return 15;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    if (self.verticalOffset) {
        return self.verticalOffset;
    }
    return -90;
}

- (nullable UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor whiteColor];
}

- (nullable NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    
    if (self.bottomButtonName) {
        return  self.bottomButtonName;//非必须
    }
    
    return nil;
    
}


- (nullable UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    if (self.bottomButtonBgImage) {
        return self.bottomButtonBgImage;
    }
    return nil;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    if (self.emptyViewTapBlock) {
        self.emptyViewTapBlock();
    }

}

#pragma mark - getters / setters

#pragma mark -currentPageStatus
- (void)setCurrentPageStatus:(PageStatus)currentPageStatus
{
    objc_setAssociatedObject(self, kCurrentPageStatus, @(currentPageStatus), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (PageStatus)currentPageStatus
{
    return [objc_getAssociatedObject(self, kCurrentPageStatus) integerValue];
}

#pragma mark - succeedEmptyStr
- (void)setSucceedEmptyStr:(NSString *)succeedEmptyStr
{
    objc_setAssociatedObject(self, kSucceedEmptyStr, succeedEmptyStr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)succeedEmptyStr
{
    return objc_getAssociatedObject(self, kSucceedEmptyStr);
}

#pragma mark - succeedEmptyAttributeStr
- (void)setSucceedEmptyAttributeStr:(NSString *)succeedEmptyAttributeStr
{
    objc_setAssociatedObject(self, kSucceedEmptyAttributeStr, succeedEmptyAttributeStr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSAttributedString *)succeedEmptyAttributeStr
{
    return objc_getAssociatedObject(self, kSucceedEmptyAttributeStr);
}

#pragma mark - succeedEmptyAttributeStrDetailStr
- (void)setSucceedEmptyAttributeStrDetailStr:(NSString *)succeedEmptyAttributeStrDetailStr
{
     objc_setAssociatedObject(self, kSucceedEmptyDetailAttributeStr, succeedEmptyAttributeStrDetailStr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSAttributedString *)succeedEmptyAttributeStrDetailStr
{
    return objc_getAssociatedObject(self, kSucceedEmptyDetailAttributeStr);
}

#pragma mark - succeedEmptyDetailStr
- (void)setSucceedEmptyDetailStr:(NSString *)succeedEmptyDetailStr
{
    objc_setAssociatedObject(self, kSucceedEmptyDetailStr, succeedEmptyDetailStr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)succeedEmptyDetailStr
{
    return objc_getAssociatedObject(self, kSucceedEmptyDetailStr);
}

#pragma mark - emptyViewTapBlock
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

#pragma mark -succeedEmptyImage
- (void)setSucceedEmptyImage:(UIImage *)succeedEmptyImage {
    
    objc_setAssociatedObject(self, kSucceedEmptyImage, succeedEmptyImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)succeedEmptyImage {
    
    return objc_getAssociatedObject(self, kSucceedEmptyImage);
}

#pragma mark -verticalOffset

- (void)setVerticalOffset:(CGFloat )verticalOffset
{
    objc_setAssociatedObject(self, kverticalOffset, @(verticalOffset), OBJC_ASSOCIATION_ASSIGN);

}

- (CGFloat )verticalOffset
{
    return [objc_getAssociatedObject(self, kverticalOffset) floatValue];
}

#pragma mark -verticalPadding

- (void)setVerticalPadding:(CGFloat )verticalPadding
{
   objc_setAssociatedObject(self, kverticalPadding, @(verticalPadding), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat )verticalPadding
{
    return [objc_getAssociatedObject(self, kverticalPadding) floatValue];
}

#pragma mark - bottomButtonBgImage

- (void)setBottomButtonName:(NSAttributedString *)bottomButtonName
{
    objc_setAssociatedObject(self, kBottomButtonName, bottomButtonName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSAttributedString *)bottomButtonName
{
    return objc_getAssociatedObject(self, kBottomButtonName);
}

#pragma mark - bottomButtonBgImage

- (void)setBottomButtonBgImage:(UIImage *)bottomButtonBgImage
{
    objc_setAssociatedObject(self, kBottomButtonBgImage, bottomButtonBgImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)bottomButtonBgImage
{
    return objc_getAssociatedObject(self, kBottomButtonBgImage);
}

#pragma mark - enableBgTap

- (void)setEnableBgTap:(BOOL)enableBgTap
{
    objc_setAssociatedObject(self, kEnableBgTap, @(enableBgTap), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)enableBgTap
{
    return [objc_getAssociatedObject(self, kEnableBgTap) boolValue];
}

@end
