//
//  UIView+JRFrame.m
//  JRKit
//
//  Created by lujianrong on 16/5/6.
//  Copyright © 2016年 lujianrong. All rights reserved.
//

#import "UIView+JRFrame.h"

#define GetSelf_Frame CGRect frame = self.frame;
#define SetSelf_Frame  self.frame = frame;
@implementation UIView (JRFrame)
- (void)setJr_x:(CGFloat)jr_x {
    GetSelf_Frame
    frame.origin.x = jr_x;
    SetSelf_Frame
}
- (CGFloat)jr_x {
    return self.frame.origin.x;
}
- (CGFloat)jr_y {
    return self.frame.origin.y;
}
- (void)setJr_y:(CGFloat)jr_y {
    GetSelf_Frame
    frame.origin.y = jr_y;
    SetSelf_Frame
}
- (CGFloat)jr_w {
    return self.frame.size.width;
}
- (void)setJr_w:(CGFloat)jr_w {
    GetSelf_Frame
    frame.size.width = jr_w;
    SetSelf_Frame
}
- (void)setJr_h:(CGFloat)jr_h {
    GetSelf_Frame
    frame.size.height = jr_h;
    SetSelf_Frame
}
- (CGFloat)jr_h {
    return self.frame.size.height;
}
- (CGFloat)jr_center_y {
    return self.center.y;
}
- (void)setJr_center_y:(CGFloat)jr_center_y {
    CGPoint center = self.center;
    center.y = jr_center_y;
    self.center = center;
}
- (void)setJr_center_x:(CGFloat)jr_center_x {
    CGPoint center = self.center;
    center.x = jr_center_x;
    self.center = center;
}
- (CGFloat)jr_center_x {
    return self.center.x;
}
- (void)setJr_size:(CGSize)jr_size {
    GetSelf_Frame
    frame.size = jr_size;
    SetSelf_Frame
}
- (CGSize)jr_size {
    return self.frame.size;
}
- (void)setJr_origin:(CGPoint)jr_origin {
    GetSelf_Frame
    frame.origin = jr_origin;
    SetSelf_Frame
}
- (CGPoint)jr_origin {
    return self.frame.origin;
}
- (void)setJr_right:(CGFloat)jr_right {
    GetSelf_Frame
    frame.origin.x = jr_right - frame.size.width;
    SetSelf_Frame
}
- (CGFloat)jr_right {
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setJr_bottom:(CGFloat)jr_bottom {
    GetSelf_Frame
    frame.origin.y = jr_bottom - frame.size.height;
    SetSelf_Frame
}
- (CGFloat)jr_bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


CGFloat _JRGetDistancePoints(CGPoint p1, CGPoint p2) {
    return sqrt((p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y));
}

CGFloat _JRGetArea(CGRect rect) {
    if (CGRectIsNull(rect)) return 0;
    rect = CGRectStandardize(rect);
    return rect.size.width * rect.size.height;
}

CGFloat _JRDegreesToRadians(CGFloat degrees) {
    return degrees * M_PI / 180;
}
CGFloat _JRRadiansToDegrees(CGFloat radians) {
    return radians * 180 / M_PI;
}
+ (void)labAnimationWithLab:(UILabel *)lab withBeginTime:(NSTimeInterval)beginTime {
    CGPathRef beginPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 0, CGRectGetHeight(lab.bounds))].CGPath;
    
    CGPathRef endPath   = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(lab.bounds), CGRectGetHeight(lab.bounds))].CGPath;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.path = beginPath;
    lab.layer.mask = layer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 1;
    animation.beginTime = CACurrentMediaTime() + beginTime;
    animation.fromValue = (id)layer.path;
    animation.toValue  = (__bridge  id)endPath;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [layer addAnimation:animation forKey:@"shapeLayerPath"];
}

@end
















