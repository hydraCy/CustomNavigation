//
//  NSObject+MethodSwizzling.h
//  CustomNavigation
//
//  Created by 蔡宇 on 2017/12/7.
//  Copyright © 2017年 hydraC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MethodSwizzling)
+(void)swizzlingMethodWithOriginalSelector:(SEL)originaledSEL bySwizziledSelector:(SEL)swizziledSEL;
@end
