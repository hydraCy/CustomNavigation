//
//  UIViewController+MethodSwizzling.h
//  CustomNavigation
//
//  Created by 蔡宇 on 2017/12/7.
//  Copyright © 2017年 hydraC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MethodSwizzling)
-(void)my_viewWillAppear:(BOOL)animated;
@end
