//
//  UIViewController+NavigationStyle.h
//  CustomNavigation
//
//  Created by 蔡宇 on 2017/12/6.
//  Copyright © 2017年 hydraC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,kNavigationType) {
    kNavigationTypeCustom = 0,
    kNavigationTypeFirst
};

@interface UIViewController (NavigationStyle)

@property (nonatomic, copy) void (^callbackLeftBlock)(UIButton * button);
@property (nonatomic, copy) void (^callbackRightBlock)(UIButton * button);
@property (nonatomic, assign) kNavigationType navigationStyleType;


-(void)setNavigationStyle; // 用于配置常规属性



@end
