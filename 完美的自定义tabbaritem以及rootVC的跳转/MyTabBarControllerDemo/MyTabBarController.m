//
//  MyTabBarController.m
//  MyTabBarControllerDemo
//
//  Created by Zilu.Ma on 16/5/22.
//  Copyright © 2016年 zilu.ma. All rights reserved.
//

#import "MyTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "MyTabBarButton.h"

@interface MyTabBarController ()

{
    MyTabBar *_myView;
}

@property (nonatomic,strong) UIButton *lastBtn;

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initContentVeiw];
    [self initTabBar];
}

- (void)initContentVeiw{
    
    FirstViewController *first = [[FirstViewController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:first];
    SecondViewController *second = [[SecondViewController alloc] init];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:second];
    ThirdViewController *third = [[ThirdViewController alloc] init];
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:third];
    
    self.viewControllers = @[firstNav,secondNav,thirdNav];
}

- (void)initTabBar{
    
    NSArray *imageSelArr = @[@"chat-round",@"down-round",@"music-round"];
    NSArray *imageArr = @[@"chat",@"download",@"music"];
    NSArray *titleArr = @[@"您好",@"我好",@"大家好"];
    
    CGRect rect = self.tabBar.bounds;
    _myView = [[MyTabBar alloc] init];
    _myView.frame = rect;
    _myView.backgroundColor = [UIColor whiteColor];
    _myView.delegate = self;
    [self.tabBar addSubview:_myView];//添加到系统的tabbar上,push隐藏就不用自己写方法
    
    for (int i = 0; i < self.viewControllers.count; i ++) {
        [_myView addButtonWithImage:[UIImage imageNamed:imageArr[i]] selectedImage:[UIImage imageNamed:imageSelArr[i]] title:titleArr[i]];
    }
}

- (void)tabBar:(MyTabBar *)tabBar selectedFrom:(NSInteger)from to:(NSInteger)to{
    
    self.selectedIndex = to;
}

//此属性是为了选择相应的tabbaritem
- (void)setSelectedBtnTag:(int)selectedBtnTag{
    
    _myView.btnTag = selectedBtnTag;
    NSLog(@"selectedBtnTag:%d",selectedBtnTag);
}

//方法一
/*
 - (void)initTabBar{
 
 CGRect rect = self.tabBar.frame;
 [self.tabBar removeFromSuperview];
 
 NSArray *imageSelArr = @[@"ic_care_colour 32px",@"ic_service upgrate_colour 32px",@"ic_vita signs_colour 32px"];
 NSArray *imageArr = @[@"ic_care_gray 32px",@"ic_service upgrate_gray 32px",@"ic_vita signs_gray 32px"];
 
 UIView *myView = [[UIView alloc] initWithFrame:rect];
 myView.backgroundColor = [UIColor yellowColor];
 [self.view addSubview:myView];
 
 CGFloat width = self.view.bounds.size.width/self.tabBar.items.count;
 
 for (int i = 0; i < self.tabBar.items.count; i ++) {
 XNTabBarButton *btn = [XNTabBarButton buttonWithType:UIButtonTypeCustom];
 
 [btn setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
 [btn setImage:[UIImage imageNamed:imageSelArr[i]] forState:UIControlStateSelected];
 btn.frame = CGRectMake(width * i, 0, width, myView.bounds.size.height);
 btn.tag = i;
 [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
 if (i == 0) {
 btn.selected = YES;
 _selectedBtn = btn;
 }
 [myView addSubview:btn];
 }
 }
 
 - (void)btnClicked:(UIButton *)btn{
 
 self.selectedBtn.selected = NO;
 btn.selected = YES;
 self.selectedBtn = btn;
 self.selectedIndex = btn.tag;
 }
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
