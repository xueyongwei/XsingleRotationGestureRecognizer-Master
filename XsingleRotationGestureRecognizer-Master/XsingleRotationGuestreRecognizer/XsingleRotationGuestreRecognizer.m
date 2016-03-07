//
//  XsingleRotationGuestreRecognizer.m
//  XsingleRotationGestureRecognizer-Master
//
//  Created by xueyongwei on 16/3/7.
//  Copyright © 2016年 xueyongwei. All rights reserved.
//

#import "XsingleRotationGuestreRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation XsingleRotationGuestreRecognizer
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 判断手势数目,单指手势
    if ([[event touchesForGestureRecognizer:self]count] > 1) {
        [self setState:UIGestureRecognizerStateFailed];
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.state == UIGestureRecognizerStatePossible) {
        [self setState:UIGestureRecognizerStateBegan];
    } else {
        [self setState:UIGestureRecognizerStateChanged];
    }
    UITouch *touch = [touches anyObject];
    // 获取手势作用视图
    UIView *view = [self view];
    CGPoint center = CGPointMake(CGRectGetMidX(view.bounds), CGRectGetMidY(view.bounds));
    // 获取当前作用手势位置
    CGPoint currentPoint = [touch locationInView:view];
    // 获取之前手势作用位置
    CGPoint previousPoint = [touch previousLocationInView:view];
    
    // 计算x和y差,然后利用tan反函数计算当前角度和手势作用之前角度
    CGFloat currentRotation = atan2f((currentPoint.y - center.y), (currentPoint.x - center.x));
    CGFloat previousRotation = atan2f((previousPoint.y - center.y), (previousPoint.x - center.x));
    
    // 得出前后手势作用旋转角度
    [self setRotation:(currentRotation - previousRotation)];
    if (self.suofang) {
        [self ViewShouldsuofang:previousPoint andCur:currentPoint];
    }
}
-(void)ViewShouldsuofang:(CGPoint)prevouesPoint andCur:(CGPoint)currentPoint
{
    UIView *view = [self view];
    CGPoint centet = CGPointMake(CGRectGetMidX(view.bounds), CGRectGetMidY(view.bounds));
    
    double preLen = sqrt((prevouesPoint.x-centet.x)*(prevouesPoint.x-centet.x)+(prevouesPoint.y-centet.y)*(prevouesPoint.y-centet.y));
    double currenLen = sqrt((currentPoint.x-centet.x)*(currentPoint.x-centet.x)+(currentPoint.y-centet.y)*(currentPoint.y-centet.y));
    
    double times = currenLen/preLen;
    NSLog(@"times = %f",times);
    [self setScale:times];
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.state == UIGestureRecognizerStateChanged) {
        [self setState:UIGestureRecognizerStateEnded];
    }else {
        [self setState:UIGestureRecognizerStateFailed];
    }
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setState:UIGestureRecognizerStateFailed];
}

@end
