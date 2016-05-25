//
//  MyTabBar.m
//  MyTabBarControllerDemo
//
//  Created by Zilu.Ma on 16/5/22.
//  Copyright © 2016年 zilu.ma. All rights reserved.
//

#import "MyTabBar.h"
#import "MyTabBarButton.h"

@interface MyTabBar ()

@property (nonatomic,strong) MyTabBarButton *selectedBtn;
//@property (nonatomic,strong) MyTabBarButton *lastBtn;

@end

@implementation MyTabBar

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

/*
 *  在这个方法里写控件初始化的东西, 调用init方法时会调用
 */
//- (id)initWithFrame:(CGRect)frame {
//  if (self = [super initWithFrame:frame]) {
//      //添加按钮
//      for (int i = 0; i < 5; i++) { //取消掉特定的数字
//          //UIButton *btn = [[UIButton alloc] init];
//          XNTabBarButton *btn = [[XNTabBarButton alloc] init];
//
//          NSString *imageName = [NSString stringWithFormat:@"TabBar%d", i + 1];
//          NSString *imageNameSel = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
//
//          [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//          [btn setImage:[UIImage imageNamed:imageNameSel] forState:UIControlStateSelected];
//
//          [self addSubview:btn];
//
//          btn.tag = i; //设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
//
//          //带参数的监听方法记得加"冒号"
//          [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
//
//          if (0 == i) {
//              [self clickBtn:btn];
//          }
//      }
//  }
//  return self;
//}

//专门用于布局子视图
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    int count = (int)self.subviews.count;
    CGFloat width = self.bounds.size.width/count;
    CGFloat height = self.bounds.size.height;
    for (int i = 0; i < count; i ++) {
        UIButton *btn = self.subviews[i];
        
        btn.tag = i; //设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
        
        btn.frame = CGRectMake(i * width, 0, width, height);
    }
}

//此方法是当跳转到不同的rootviewController是,选择相应的tabbaritem
- (void)setBtnTag:(int)btnTag{
    
    NSLog(@"btnTag:%d",btnTag);
    MyTabBarButton *btn = self.subviews[btnTag];
    self.selectedBtn.selected = NO;
    //2.再将当前按钮设置为选中
    btn.selected = YES;
    //3.最后把当前按钮赋值为之前选中的按钮
    self.selectedBtn = btn;
}

-(void)addButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectImage title:(NSString *)title{
    
    MyTabBarButton *btn = [MyTabBarButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectImage forState:UIControlStateSelected];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    
    //调整图片与字体之间的间距
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    
    //自定义背景图片
//    [self addBgView:btn];
    
    if (self.subviews.count == 0) {
        [self clickBtn:btn];
    }
    [self addSubview:btn];
}

//可在此自定义btn的背景
- (void)addBgView:(UIView *)view{
    
    
}

- (void)clickBtn:(MyTabBarButton *)btn{
    
    self.selectedBtn.selected = NO;
    //2.再将当前按钮设置为选中
    btn.selected = YES;
    //3.最后把当前按钮赋值为之前选中的按钮
    self.selectedBtn = btn;
    
    //却换视图控制器的事情,应该交给controller来做
    //最好这样写, 先判断该代理方法是否实现
    if ([self.delegate respondsToSelector:@selector(tabBar:selectedFrom:to:)]) {
        [self.delegate tabBar:self selectedFrom:self.selectedBtn.tag to:btn.tag];
    }
    
    //4.跳转到相应的视图控制器. (通过selectIndex参数来设置选中了那个控制器)
    //    self.selectedIndex = btn.tag;
}

@end
