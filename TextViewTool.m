//
//  TextViewTool.m
//  WellnessClub
//
//  Created by NewYuLong on 15/12/28.
//  Copyright © 2015年 sky. All rights reserved.
//

#import "TextViewTool.h"
#import "UIView+JRFrame.h"
@implementation TextViewTool
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/**
 *  XIB 创建会走这个方法
 */
- (void)awakeFromNib {
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textViewEdingChange) name:UITextViewTextDidChangeNotification object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textViewEdingChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}
- (void)textViewEdingChange {
    [self setNeedsDisplay];
    if (self.maxLength && self.text.length >= self.maxLength) {
        self.text = [self.text substringToIndex:self.maxLength];
    }
}
- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    [self setNeedsDisplay];
}
- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    [self setNeedsDisplay];
}
- (void)setFont:(UIFont *)font {
    [super setFont:font];
    [self setNeedsDisplay];
}
- (void)setText:(NSString *)text {
    [super setText:text];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if (self.hasText) return;
    CGFloat x = 5;
    CGFloat y = 8;
    CGFloat w = self.jr_w - 2*x;
    CGFloat h = self.jr_h - 2*y;
    CGRect frame = CGRectMake(x, y, w, h);
    NSMutableDictionary *placeholderDic = @{}.mutableCopy;
    placeholderDic[NSForegroundColorAttributeName] =self.placeholderColor?self.placeholderColor :[UIColor lightGrayColor];
    placeholderDic[NSFontAttributeName] = self.font;
    [self.placeholder drawInRect:frame withAttributes:placeholderDic];
}


@end
