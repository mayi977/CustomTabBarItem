//
//  FirstViewController.m
//  TabBarControllerDemo
//
//  Created by Zilu.Ma on 16/5/22.
//  Copyright © 2016年 zilu.ma. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstOneViewController.h"
#import "AppDelegate.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSLog(@"%d",app.skip);
    if (app.skip) {
        [app.tabBarController setSelectedIndex:2];
        [app.tabBarController setSelectedBtnTag:2];
        app.skip = NO;
    }
}

- (IBAction)goOne:(id)sender {
    
    FirstOneViewController *one = [[FirstOneViewController alloc] init];
    one.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:one animated:YES];
}


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
