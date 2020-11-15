# HZSAlertViewManager

[![CI Status](https://img.shields.io/travis/1498522607@qq.com/HZSAlertViewManager.svg?style=flat)](https://travis-ci.org/1498522607@qq.com/HZSAlertViewManager)
[![Version](https://img.shields.io/cocoapods/v/HZSAlertViewManager.svg?style=flat)](https://cocoapods.org/pods/HZSAlertViewManager)
[![License](https://img.shields.io/cocoapods/l/HZSAlertViewManager.svg?style=flat)](https://cocoapods.org/pods/HZSAlertViewManager)
[![Platform](https://img.shields.io/cocoapods/p/HZSAlertViewManager.svg?style=flat)](https://cocoapods.org/pods/HZSAlertViewManager)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
```ruby
[[HZSAlertViewManager shareManager] showWithExecuteBlock:^{
    [[[HZSCustomAlertView alloc] init] showInView:self.view dissMiss:^{
        //消失时调用dissmiss
        [[HZSAlertViewManager shareManager] dismissWithExecuteBlock:nil];
    }];
}];

[[HZSAlertViewManager shareManager] showWithExecuteBlock:^{
    UIAlertController * alertV = [UIAlertController alertControllerWithTitle:@"弹出" message:@"系统弹窗" preferredStyle:UIAlertControllerStyleAlert];
    [alertV addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //消失时调用dissmiss
        [[HZSAlertViewManager shareManager] dismissWithExecuteBlock:nil];
    }]];
    [self presentViewController:alertV animated:YES completion:nil];
}];
```

## Requirements

## Installation

HZSAlertViewManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HZSAlertViewManager'
```

## Author

古德猫宁，1498522607@qq.com

## License

HZSAlertViewManager is available under the MIT license. See the LICENSE file for more info.
