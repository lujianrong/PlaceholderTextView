//
//  TextViewTool.h
//  WellnessClub
//
//  Created by lujianrong on 16/5/6.
//  Copyright © 2016年 lujianrong. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  自定义带 placeholder 的TextView
 */
@interface TextViewTool : UITextView
@property (nonatomic,   copy) NSString      *placeholder;
@property (nonatomic, strong) UIColor       *placeholderColor;
/**
 *  最大输入长度限制
 */
@property (nonatomic, assign) NSUInteger    maxLength;
@end
