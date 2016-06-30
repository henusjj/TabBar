//
//  Syjtabbar2.m
//  TbaBar
//
//  Created by 史玉金 on 16/6/29.
//  Copyright © 2016年 史玉金. All rights reserved.
//

#import "Syjtabbar2.h"
#import "SyjtabbarButton.h"
#import "UIView+Frame.h"

@interface Syjtabbar2 ()

@property(nonatomic,strong)SyjtabbarButton *currentBtn;
/**
 添加选项卡 +
  */

@property(nonatomic,strong)UIButton *plusBtn;

/**
 定义一个可变数组，来设置每个btn 的tag值
  */
@property(nonatomic,strong)NSMutableArray *BtnTag;

@end

@implementation Syjtabbar2
//懒加载
-(NSMutableArray *)BtnTag{
    if (!_BtnTag) {
        _BtnTag=[NSMutableArray arrayWithCapacity:4];
    }
    return _BtnTag;
}


-(instancetype)init{
    if (self=[super init]) {
        //设置背景颜色
        self.backgroundColor=[UIColor whiteColor];
        
        //添加选项卡+
        [self addPlusBtn];
    }
    return self;
}

-(void)addtabbarItem:(UITabBarItem *)item{
    //创建选项卡，每一个都是butn，可以定义一个button类
    SyjtabbarButton *ItemBtn=[[SyjtabbarButton alloc]init];//会调用init方法从写
    /**
    //设置每一个按钮的属性
    [ItemBtn setTitle:item.title forState:UIControlStateNormal];
    [ItemBtn setImage:item.image forState:UIControlStateNormal];
    [ItemBtn setImage:item.selectedImage forState:UIControlStateSelected];
    放在自定义的button里面
    */
    
    ItemBtn.item=item;//set方法
    
    //UIbutton 的选中状态默认是NO；这里需要我们设置一些属性
    //添加ItemBtn的监听事件
    [ItemBtn addTarget:self action:@selector(ClickBtnItem:) forControlEvents:UIControlEventTouchUpInside];
    
    //添加到当前的View中
    [self addSubview:ItemBtn];
    
    ItemBtn.tag=self.BtnTag.count;//0
    //每一次创建Controller的时候，就会有一个item，
    
    [self.BtnTag addObject:ItemBtn];//第二次为 1，2，3，4
    //有数组判断，来默认选中第一个按钮
    if (self.BtnTag.count==1)
    {
        [self ClickBtnItem:ItemBtn];
    }
    NSLog(@"count = %tu", self.subviews.count);

    
//    //设置默认选中的按钮，// 默认情况下subviews.count等于0, 只要添加了一个按钮那么就代表肯定是第一个
//    if (self.subviews.count==1) {
//        [self ClickBtnItem:ItemBtn];
//    }
    //添加数组后，出现bug，不能选中第一个，原因是self.subviews.count的值第一次就是2，修改1--为2，可解决。
//    
}

-(void)ClickBtnItem:(SyjtabbarButton *)btn{
    
//取消上一次的选中
    self.currentBtn.selected=NO;//默认是NO；
    //选中当前的按钮
    btn.selected=YES;
    
    //记录当前选中的按钮
    self.currentBtn=btn;
    
    //切换控制器，通知 tabbarController
    if ([self.delegate respondsToSelector:@selector(tabbar:selectBtnFrom:to:)]) {
        [self.delegate tabbar:self selectBtnFrom:self.currentBtn.tag to:btn.tag];
    }
    
    
}

-(void)addPlusBtn{
        //设置数据
    UIButton *plusBtn=[[UIButton alloc]init];
    plusBtn.tag=100;
    
    //设置背景图片
    // 2.设置背景图片
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    // 3.设置图标
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    // 4.添加
    
    self.plusBtn=plusBtn;

    [self addSubview:plusBtn];

}



/**
 这里设置ItemBtn的大小,在父控件类修改子控件ItenmBtn 的大小
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    
    NSInteger index=0;
    for (UIButton *child in self.subviews) {
       
        if (child.tag==100) {
            continue;
        }
            //设置大小---每一个View
            // 2.计算每个按钮的frame
            CGFloat childW = self.frame.size.width / 5;
            CGFloat childH = self.frame.size.height;
            CGFloat childX = index * childW;
            CGFloat childY = 0;
            
            // 判断是否是中间一个按钮
            if (index == 2) {
                index++;
                childX = index * childW;//这里，没有设置其数据
            }
            index++;
            child.frame = CGRectMake(childX, childY, childW, childH);
        

    }
    
    //设置pluBtn的位子和大小
    self.plusBtn.size=self.plusBtn.currentBackgroundImage.size;//btn的大小和图片一样大
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
