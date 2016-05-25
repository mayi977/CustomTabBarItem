//
//  MyTabBarController.h
//  MyTabBarControllerDemo
//
//  Created by Zilu.Ma on 16/5/22.
//  Copyright © 2016年 zilu.ma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTabBar.h"

@interface MyTabBarController : UITabBarController<MyTabBarDelegate>

@property (nonatomic,assign) int selectedBtnTag;

@end
