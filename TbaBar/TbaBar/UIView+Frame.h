//
//  UIView+Frame.h
//  12期微博
//
//  Created by apple on 15-1-28.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

/*
 如果在一个普通的类中添加@property: @property会自动生成setter/getter方法的声明和实现, 并且会在.m中生成一个私有的属性
 如果在分类中添加property: property"只会"自动生成setter/getter方法的声明, 不会生成实现以及私有的属性
 */
@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGFloat centerX;
@property (nonatomic, assign)CGFloat centerY;
@property (nonatomic, assign)CGSize size;

@end
