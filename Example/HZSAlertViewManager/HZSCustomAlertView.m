//
//  HZSCustomAlertView.m
//  HZSAlertViewManager_Example
//
//  Created by hzsMac on 2020/11/15.
//  Copyright © 2020 1498522607@qq.com. All rights reserved.
//

#import "HZSCustomAlertView.h"

@interface HZSCustomAlertView ()
@property (copy, nonatomic) void(^dissMissBlock)();
@end


@implementation HZSCustomAlertView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout {
    UIButton * btn = [[UIButton alloc] init];
    [self addSubview:btn];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 100, 200, 200);
    [btn setTitle:@"点击后消失" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnOnClickAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnOnClickAction {
    [self dissMiss];
    
    self.dissMissBlock();
}


- (void)showInView:(UIView *)view dissMiss:(void(^)())dissMiss {
    self.dissMissBlock = dissMiss;
    //显示
    self.alpha = 0;
    //重要提醒！:自定义的弹窗不要添加再[UIApplication sharedApplication].keyWindow上, keyWindow是会变化的，因为系统的弹窗是创建一个window，成为keyWindow，当系统弹窗消失的时候，创建出来的window也会销毁，但是这时候获取的keyWindow有可能就是准备销毁这个.这样的自定义弹窗连同keywindow一起被销毁，导致信号一直是锁着的状态，无法弹出后面的弹窗
    [view addSubview:self];
    self.frame = self.superview.bounds;
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1;
    }];
}

- (void)dissMiss {
    //移除
    NSLog(@"%@", self);
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
