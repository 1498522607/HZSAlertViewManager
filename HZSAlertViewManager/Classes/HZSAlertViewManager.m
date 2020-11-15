//
//  HZSAlertViewManager.m
//  FBSnapshotTestCase
//
//  Created by hzsMac on 2020/11/15.
//

#import "HZSAlertViewManager.h"

//全局信号量
dispatch_semaphore_t _globalInstancesLockSEM;
//执行QUEUE的Name
char *QUEUE_NAME_SEM = "com.alert.queueSEM";
//初始化 -- 借鉴YYWebImage的写法
static void _AlertViewInitGlobalSEM() {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _globalInstancesLockSEM = dispatch_semaphore_create(1);
    });
}

@implementation HZSAlertViewManager


- (void)showWithExecuteBlock:(ExecuteBlock)executeBlock {
    dispatch_async(dispatch_queue_create(QUEUE_NAME_SEM, DISPATCH_QUEUE_SERIAL), ^{
        dispatch_semaphore_wait(_globalInstancesLockSEM, DISPATCH_TIME_FOREVER);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (executeBlock) {
                executeBlock();
            }
        });
    });
}

- (void)dismissWithExecuteBlock:(ExecuteBlock)executeBlock {
    dispatch_async(dispatch_queue_create(QUEUE_NAME_SEM, DISPATCH_QUEUE_SERIAL), ^{
        dispatch_semaphore_signal(_globalInstancesLockSEM);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (executeBlock) {
                executeBlock();
            }
        });
    });
}


+ (instancetype)shareManager {
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static id instan = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instan = [super allocWithZone:zone];
    });
    return instan;
}

- (instancetype)init {
    if (self = [super init]) {
        _AlertViewInitGlobalSEM();
    }
    return self;
}


@end
