//
//  HZSViewController.m
//  HZSAlertViewManager
//
//  Created by 1498522607@qq.com on 11/15/2020.
//  Copyright (c) 2020 1498522607@qq.com. All rights reserved.
//

#import "HZSViewController.h"
#import "HZSAlertViewManager.h"
#import "HZSCustomAlertView.h"


@interface HZSViewController ()

@end

@implementation HZSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)noDealBtnOnClickAction:(id)sender {
    [[[HZSCustomAlertView alloc] init] showInView:self.view dissMiss:^{
        
    }];
    UIAlertController * alertV = [UIAlertController alertControllerWithTitle:@"弹出" message:@"系统弹窗" preferredStyle:UIAlertControllerStyleAlert];
    [alertV addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alertV animated:YES completion:nil];
}

- (IBAction)btnOnClickAction:(id)sender {
    [[HZSAlertViewManager defaultManager] showWithExecuteBlock:^(HZSAlertViewManager *defaultManager) {
        [[[HZSCustomAlertView alloc] init] showInView:self.view dissMiss:^{
            //消失时调用dissmiss
            [defaultManager dismissWithExecuteBlock:nil];
        }];
    }];
    
    [[HZSAlertViewManager defaultManager] showWithExecuteBlock:^(HZSAlertViewManager *defaultManager) {
        UIAlertController * alertV = [UIAlertController alertControllerWithTitle:@"弹出" message:@"系统弹窗" preferredStyle:UIAlertControllerStyleAlert];
        [alertV addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //消失时调用dissmiss
            [defaultManager dismissWithExecuteBlock:nil];
        }]];
        [self presentViewController:alertV animated:YES completion:nil];
    }];
}



@end
