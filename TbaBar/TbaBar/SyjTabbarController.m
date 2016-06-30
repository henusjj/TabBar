//
//  SyjTabbarController.m
//  TbaBar
//
//  Created by 史玉金 on 16/6/29.
//  Copyright © 2016年 史玉金. All rights reserved.
//

#import "SyjTabbarController.h"
#import "SyjTabbar1.h"

//完全自定义tabbar
#import "Syjtabbar2.h"

@interface SyjTabbarController ()<Syjtabbar2Delegate>

@property(nonatomic,strong)Syjtabbar2 *tabBtn2;

@end

@implementation SyjTabbarController

-(instancetype)init{
    if (self=[super init]) {
        //初始化
        // 创建子控制器
        
        UIViewController *home = [self addControllerWithClass:[UIViewController class] title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
        UIViewController *message = [self addControllerWithClass:[UIViewController class] title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
        UIViewController *discover = [self addControllerWithClass:[UIViewController class] title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
        UIViewController *profile = [self addControllerWithClass:[UIViewController class] title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
        
//        self.viewControllers=@[home,message,discover,profile];
        
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    SyjTabbar1 *tabBtn=[[SyjTabbar1 alloc]init];
//    
//    [self setValue:tabBtn forKey:@"tabBar"];
    
    /**
     *第二种，完全修改tabbar
     *
     */
    
    //创建自定义tabbar2
    Syjtabbar2 *tabbar=[[Syjtabbar2 alloc]init];//init创建控件
    //设置大小
    tabbar.frame=self.tabBar.frame;
    //添加到父控件中
    [self.view addSubview:tabbar];
    
    self.tabBtn2=tabbar;

    //移除系统的tabBar
    [self.tabBar removeFromSuperview];
    
    
    //设置代理
    tabbar.delegate=self;

}


-(UIViewController *)addControllerWithClass:(Class)class title:(NSString *)title image:(NSString *)ImageName selectedImage:(NSString  *)selectImg{
    UIViewController *vc=[[class alloc]init];
    UINavigationController *nv=[[UINavigationController alloc]initWithRootViewController:vc];
    vc.tabBarItem.title=title;
    vc.tabBarItem.image=[UIImage imageNamed:ImageName];
    //选中时的图片
    UIImage *newImage=[UIImage imageNamed:selectImg];
    newImage=[newImage imageWithRenderingMode:YES];//图片原样显示
    vc.tabBarItem.selectedImage=newImage;
    
    vc.view.backgroundColor=[UIColor colorWithRed: ((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];//随机颜色
    
    // 设置tabBarButton的标题颜色的文字
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    
    [self addChildViewController:nv];
    
    //系统的tabbarItem已经被移除，这里我们需要把我们自定义的tabbar中加上一个tabbarItem，
    [self.tabBtn2 addtabbarItem:vc.tabBarItem];
    
    return vc;
    
}


//实现代理方法
-(void)tabbar:(Syjtabbar2 *)tabBar selectBtnFrom:(NSInteger)from to:(NSInteger)to{
    //切换控制器
        UIViewController *vc = self.childViewControllers[to];
        self.selectedViewController = vc;

}

@end
