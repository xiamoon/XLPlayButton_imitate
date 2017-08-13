//
//  YouKuPlayButton.m
//  XLPlayButton_imitate
//
//  Created by 李乾 on 2017/8/13.
//  Copyright © 2017年 liqian. All rights reserved.
//

#import "YouKuPlayButton.h"

static CGFloat animationDuration = 0.35f;
#define BlueColor   [UIColor colorWithRed:62/255.0 green:157/255.0 blue:254/255.0 alpha:1]
#define LightBlueColor     [UIColor colorWithRed:87/255.0 green:188/255.0 blue:253/255.0 alpha:1]
#define RedColor        [UIColor colorWithRed:228/255.0 green:35/255.0 blue:6/255.0 alpha:0.8]

@interface YouKuPlayButton () {
    CAShapeLayer *_leftLineLayer;
    CAShapeLayer *_leftCircle;
    CAShapeLayer *_rightLineLayer;
    CAShapeLayer *_rightCircle;
    
    CALayer *_triangleContainer;
    BOOL _isAnimation;
}

@end

@implementation YouKuPlayButton

- (instancetype)initWithFrame:(CGRect)frame state:(YouKuPlayButtonState)state {
    if (self == [super initWithFrame:frame]) {
        [self buildUI];
        if (state == YouKuPlayButtonStatePlay) {
            self.buttonState = state;
        }
    }
    return self;
}

- (void)buildUI {
    [self addLeafLineLayer];
}

- (void)addLeafLineLayer {
    CGFloat a = self.layer.bounds.size.width;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(a*0.2, a*0.9)];
    [path addLineToPoint:CGPointMake(a*0.2, a*0.1)];
    
    // 一个‘UIBezierPath’路径就可以在layer上绘制出一条竖线，这里为何还要创建一个CAShapeLayer？
    // 这是因为path的确可以绘制出内容并显示出来，但是我们无法对绘制好的笔画进行变换。所以只有把这个笔画装进一个layer中。
    // 况且，path笔画只有装进layer中才能显示。一般在drawRect:中进行绘制，其实也是会知道当前view的根layer中。
    // 可以模拟画板和笔画。
    
    // 这里有点多此一举了。不用加path代码，只需要创建一个有颜色的layer不就行了吗？
    
    // 延伸：什么时候需要这种layer.path的操作？当layer需要显示的内容较复杂时。
    _leftLineLayer = [CAShapeLayer layer];
    _leftLineLayer.path = path.CGPath;
    _leftLineLayer.fillColor = [UIColor clearColor].CGColor;
    _leftLineLayer.strokeColor = BlueColor.CGColor;
    _leftLineLayer.lineWidth = [self lineWidth];
    _leftLineLayer.lineCap = kCALineCapRound;
    _leftLineLayer.lineJoin = kCALineJoinRound;
    [self.layer addSublayer:_leftLineLayer];
}

- (void)addLeftCircle {
    CGFloat a = self.layer.bounds.size.width;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(a*0.2, a*0.9)];
    CGFloat startAngle = acos(4.0/5) + M_PI_2;
    CGFloat endAngle = startAngle - M_PI;
    [path addArcWithCenter:CGPointMake(a*0.5, a*0.5) radius:0.5*a startAngle:startAngle endAngle:endAngle clockwise:NO];
    //[UIBezierPath bezierPathWithArcCenter:CGPointMake(a*0.5, a*0.5) radius:0.5*a startAngle:startAngle endAngle:endAngle clockwise:NO]; 试下这个
    
}

- (CGFloat)lineWidth {
    return self.layer.bounds.size.width*0.16;
}


@end
