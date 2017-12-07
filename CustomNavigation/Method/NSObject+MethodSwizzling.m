//
//  NSObject+MethodSwizzling.m
//  CustomNavigation
//
//  Created by 蔡宇 on 2017/12/7.
//  Copyright © 2017年 hydraC. All rights reserved.
//

#import "NSObject+MethodSwizzling.h"
#import <objc/runtime.h>
@implementation NSObject (MethodSwizzling)
+(void)swizzlingMethodWithOriginalSelector:(SEL)originaledSEL bySwizziledSelector:(SEL)swizziledSEL{
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originaledSEL);
    Method swizzledMethod = class_getInstanceMethod(class, swizziledSEL);
    
    BOOL didAddMethod = class_addMethod(class, originaledSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizziledSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}
@end
