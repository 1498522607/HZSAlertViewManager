//
//  HZSCustomAlertView.h
//  HZSAlertViewManager_Example
//
//  Created by hzsMac on 2020/11/15.
//  Copyright © 2020 1498522607@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZSCustomAlertView : UIView

- (void)showInView:(UIView *)view dissMiss:(void(^)())dissMiss;


@end

NS_ASSUME_NONNULL_END
