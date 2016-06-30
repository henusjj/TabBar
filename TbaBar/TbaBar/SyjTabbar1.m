//
//  SyjTabbar1.m
//  TbaBar
//
//  Created by 史玉金 on 16/6/29.
//  Copyright © 2016年 史玉金. All rights reserved.
//

#import "SyjTabbar1.h"
#import "UIView+Frame.h"

@interface SyjTabbar1 ()

/**
 *  修改系统tabbar，添加选项卡
 */
@property(nonatomic,weak)UIButton *plusBtn;

@end
@implementation SyjTabbar1

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        //添加控件----plusBtn
        UIButton *btn=[[UIButton alloc]init];
        //设置图片
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close"] forState:UIControlStateHighlighted];
        //设置btn的标识符
        btn.tag=111;
        
        
        //添加到tabbar中
        self.plusBtn=btn;
        
        [self addSubview:btn];
        //设置大小，需要在laysubview中
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    NSInteger index=0;
    
    for (UIView *child in self.subviews) {
        
        //把tag为111的去掉，修复bug
        /**
         *  或者
         if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")])
         */
        
        if ([child isKindOfClass:[UIControl class]]) {
            if (child.tag==111) {
                continue;
            }
            
            //计算每个按钮的fram
            CGFloat childW=self.frame.size.width/5;
            CGFloat childH=self.frame.size.height;
            CGFloat childX=index *childW;//0
            CGFloat childY=0;
            if (index==2) {
                index++;
                childX=index*childW;
            }
            index++;
            child.frame=CGRectMake(childX, childY, childW, childH);
            
            
        }
        
    }
    
    //plusBtn的大小就是图片大小
    self.plusBtn.size=self.plusBtn.currentBackgroundImage.size;
    self.plusBtn.centerX=self.width*0.5;
    self.plusBtn.centerY=self.height*0.5;
    


    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
