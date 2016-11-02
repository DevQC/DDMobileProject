//
//  UILabel+LineSpace.m
//  zxptUser
//
//  Created by QJ_001 on 16/7/9.
//  Copyright © 2016年 qijia. All rights reserved.
//

#import "UILabel+LineSpace.h"

@implementation UILabel (LineSpace)

- (void)setText:(NSString *)text WithLineSpace:(CGFloat)lineSpace
{
    NSString *titleText = text?text:@"";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:titleText];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0,titleText.length)];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    // 行间距
    if(lineSpace > 0){
        
        [paragraphStyle setLineSpacing:lineSpace];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,titleText.length)];
    }
    
    self.attributedText = attributedString;
}

@end
