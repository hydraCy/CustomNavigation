//
//  UIViewController+MethodSwizzling.m
//  CustomNavigation
//
//  Created by 蔡宇 on 2017/12/7.
//  Copyright © 2017年 hydraC. All rights reserved.
//

#import "UIViewController+MethodSwizzling.h"
#import "NSObject+MethodSwizzling.h"
@implementation UIViewController (MethodSwizzling)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzlingMethodWithOriginalSelector:@selector(viewWillAppear:) bySwizziledSelector:@selector(my_viewWillAppear:)];
    });
    
}

-(void)my_viewWillAppear:(BOOL)animated{
    NSLog(@"调用了自己定义的viewWillAppear方法");
    [self my_viewWillAppear:YES];
}
@end
