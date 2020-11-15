//
//  HZSAlertViewManager.h
//  FBSnapshotTestCase
//
//  Created by hzsMac on 2020/11/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ExecuteBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface HZSAlertViewManager : NSObject

//重要提醒！:自定义的弹窗不要添加再[UIApplication sharedApplication].keyWindow上, keyWindow是会变化的，因为系统的弹窗是创建一个window，成为keyWindow，当系统弹窗消失的时候，创建出来的window也会销毁，但是这时候获取的keyWindow有可能就是准备销毁这个.这样的自定义弹窗连同keywindow一起被销毁，导致信号一直是锁着的状态，无法弹出后面的弹窗
//系统弹窗消失瞬间获取到的keyWindow就是系统弹窗那个keyWindow，自定义弹窗添加上去会随着keywindow销毁而销毁
+ (instancetype)shareManager;
/**
 弹窗显示的代码写进BLOCK块内
 @param executeBlock <#executeBlock description#>
 */
- (void)showWithExecuteBlock:(nonnull ExecuteBlock)executeBlock;
/**
 弹窗显示完毕调用
 @param executeBlock 可以为空但是一定要调用
 */
- (void)dismissWithExecuteBlock:(nullable ExecuteBlock)executeBlock;

@end

NS_ASSUME_NONNULL_END
