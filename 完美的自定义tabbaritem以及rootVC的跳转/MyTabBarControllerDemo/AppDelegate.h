//
//  AppDelegate.h
//  MyTabBarControllerDemo
//
//  Created by Zilu.Ma on 16/5/22.
//  Copyright © 2016年 zilu.ma. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MyTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) MyTabBarController *tabBarController;
@property (nonatomic,assign) BOOL skip;

@end

