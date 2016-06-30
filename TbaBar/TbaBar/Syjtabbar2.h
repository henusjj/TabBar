//
//  Syjtabbar2.h
//  TbaBar
//
//  Created by 史玉金 on 16/6/29.
//  Copyright © 2016年 史玉金. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  1，说要找代理对象就在谁的头文件编写代理协议
 2，在要找代理的类中，添加代理属性
 3，设置代理
 4，准许代理的相关方法
 */
//tabbar找代理，实现，点击Item的时候，有控制器跳转到相关的控制器

@class Syjtabbar2;
@protocol Syjtabbar2Delegate <NSObject>

-(void)tabbar:(Syjtabbar2 *)tabBar selectBtnFrom:(NSInteger)from to:(NSInteger)to;

@end


@interface Syjtabbar2 : UIView


-(void)addtabbarItem:(UITabBarItem *)item;

@property(nonatomic,weak)id<Syjtabbar2Delegate>delegate;

@end
