//
//  ViewController.m
//  CustomNavigation
//
//  Created by 蔡宇 on 2017/12/6.
//  Copyright © 2017年 hydraC. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+NavigationStyle.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationStyleType =  kNavigationTypeFirst;
    [self setNavigationStyle];
    self.callbackLeftBlock = ^(UIButton *button) {
        NSLog(@"左侧按钮点击");
    };
    self.callbackRightBlock = ^(UIButton *button) {
        NSLog(@"右侧按钮点击");
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
