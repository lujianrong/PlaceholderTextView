//
//  UIView+JRFrame.h
//  JRKit
//
//  Created by lujianrong on 16/5/6.
//  Copyright © 2016年 lujianrong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewHelpMacro.h"
#import "UIColor+JRCategory.h"

@interface UIView (JRFrame)
@property (nonatomic, assign) CGFloat    jr_x;
@property (nonatomic, assign) CGFloat    jr_y;
@property (nonatomic, assign) CGFloat    jr_w;
@property (nonatomic, assign) CGFloat    jr_h;
@property (nonatomic, assign) CGFloat    jr_center_x;
@property (nonatomic, assign) CGFloat    jr_center_y;
@property (nonatomic, assign) CGSize     jr_size;
@property (nonatomic, assign) CGPoint    jr_origin;
@property (nonatomic, assign) CGFloat    jr_right;
@property (nonatomic, assign) CGFloat    jr_bottom;
@property (nullable, nonatomic, readonly) UIViewController *viewController;
/**
 *  两点间距离
 */
CGFloat _JRGetDistancePoints(CGPoint p1, CGPoint p2);
/**
 *  矩形面积
 */
CGFloat _JRGetArea(CGRect rect);
/**
 *  角度转弧度
 */
CGFloat _JRDegreesToRadians(CGFloat degrees);
/**
 *  弧度转角度
 */
CGFloat _JRRadiansToDegrees(CGFloat radians);

@end
