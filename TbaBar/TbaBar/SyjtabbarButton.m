//
//  SyjtabbarButton.m
//  TbaBar
//
//  Created by 史玉金 on 16/6/30.
//  Copyright © 2016年 史玉金. All rights reserved.
//

#import "SyjtabbarButton.h"
#import "UIView+Frame.h"


@implementation SyjtabbarButton

-(instancetype)init{
    if (self=[super init]) {
        //设置图片居中
        self.imageView.contentMode=UIViewContentModeCenter;
        
        //设置标题居中
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        
        //设置文字字体大小
        self.titleLabel.font=[UIFont systemFontOfSize:13];
        
        // 设置按钮标题颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        /**
         *  这之上，显示的tabbar是左右结构的，因为button
         */
        
    }
    return self;
}

/**
 *运用uibutton的方法，是图片文字，上下结构
 *
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.width;
    CGFloat imageH = self.height * 0.6;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    // Y = 按钮的高度 - 图片的高度
    CGFloat titleY = self.height * 0.6;
    CGFloat titleW = self.width;
    CGFloat titleH = self.height - self.height * 0.6;
    return CGRectMake(titleX, titleY, titleW, titleH);
}


-(void)setItem:(UITabBarItem *)item{
    _item=item;
    
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
