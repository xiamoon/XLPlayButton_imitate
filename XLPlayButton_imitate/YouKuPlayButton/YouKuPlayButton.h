//
//  YouKuPlayButton.h
//  XLPlayButton_imitate
//
//  Created by 李乾 on 2017/8/13.
//  Copyright © 2017年 liqian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YouKuPlayButtonState) {
    YouKuPlayButtonStatePause = 0,
    YouKuPlayButtonStatePlay
};

@interface YouKuPlayButton : UIButton

@property (nonatomic, assign) YouKuPlayButtonState buttonState;

- (instancetype)initWithFrame:(CGRect)frame state:(YouKuPlayButtonState)state;

@end
