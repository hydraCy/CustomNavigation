//
//  UIViewController+NavigationStyle.m
//  CustomNavigation
//
//  Created by 蔡宇 on 2017/12/6.
//  Copyright © 2017年 hydraC. All rights reserved.
//

#import "UIViewController+NavigationStyle.h"
#import <objc/runtime.h>

@interface UIViewController()
@property(nonatomic,strong) UIButton *leftButton;
@property(nonatomic,strong) UIButton *rightButton;
@end

@implementation UIViewController (NavigationStyle)

-(void)setNavigationStyle{
    //此处可统一配置,设置默认button样式
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 82, 14)];
    [self.leftButton setTitle:@"leftBtn" forState:UIControlStateNormal];
    self.leftButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [self.leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 82, 14)];
    [self.rightButton setTitle:@"rightButton" forState:UIControlStateNormal];
    self.rightButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [self.rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
    
    
}

//添加type属性 用于多种type

-(void)setNavigationStyleType:(kNavigationType)navigationStyleType{
    objc_setAssociatedObject(self, @selector(navigationStyleType), @(navigationStyleType), OBJC_ASSOCIATION_ASSIGN);
    [self setNavigationStyleWithType];
}

-(kNavigationType)navigationStyleType{
    return [objc_getAssociatedObject(self, @selector(navigationStyleType)) integerValue];
}
//用于根据不同type进行个性化配置,包括button的frame
-(void)setNavigationStyleWithType{
    switch (self.navigationStyleType) {
        case kNavigationTypeCustom:
            NSLog(@"0");
            
            break;
        case kNavigationTypeFirst:
            NSLog(@"1");
            break;
        default:
            break;
    }
    
}


//动态添加左右button以及点击回调

-(void)setLeftButton:(UIButton *)leftButton{
    objc_setAssociatedObject(self, @selector(leftButton), leftButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIButton *)leftButton{
    return objc_getAssociatedObject(self, @selector(leftButton));
}

-(void)setRightButton:(UIButton *)rightButton{
    objc_setAssociatedObject(self, @selector(rightButton), rightButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIButton *)rightButton{
    
    return objc_getAssociatedObject(self, @selector(rightButton));
}

-(void)setCallbackLeftBlock:(void (^)(UIButton *))callbackLeftBlock{
    objc_setAssociatedObject(self, @selector(callbackLeftBlock), callbackLeftBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void (^)(UIButton *))callbackLeftBlock{
    return objc_getAssociatedObject(self, @selector(callbackLeftBlock));
}

-(void)setCallbackRightBlock:(void (^)(UIButton *))callbackRightBlock{
    objc_setAssociatedObject(self, @selector(callbackRightBlock), callbackRightBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void (^)(UIButton *))callbackRightBlock{
    return objc_getAssociatedObject(self, @selector(callbackRightBlock));
}

//左右button点击事件

-(void)leftButtonClick:(UIButton *)leftBtn{
    if (self.callbackLeftBlock) {
        self.callbackLeftBlock(leftBtn);
    }
}

-(void)rightButtonClick:(UIButton *)rightBtn{
    if (self.callbackRightBlock) {
        self.callbackRightBlock(rightBtn);
    }
}



@end
