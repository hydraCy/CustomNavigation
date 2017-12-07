//
//  ViewController.m
//  CustomNavigation
//
//  Created by 蔡宇 on 2017/12/6.
//  Copyright © 2017年 hydraC. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+NavigationStyle.h"
#import "UIViewController+MethodSwizzling.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *methodBtn;
@property (weak, nonatomic) IBOutlet UIButton *IvarBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setNavigationStyle];
    self.navigationStyleType =  kNavigationTypeFirst;
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
- (IBAction)methodAction:(id)sender {
}
- (IBAction)IvarAction:(id)sender {
}







@end
