//
//  ThirdViewController.m
//  TabBarControllerDemo
//
//  Created by Zilu.Ma on 16/5/22.
//  Copyright © 2016年 zilu.ma. All rights reserved.
//

#import "ThirdViewController.h"
#import "ThirdOneViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
}

- (IBAction)goThirdOne:(id)sender {
    
    ThirdOneViewController *thirdOne = [[ThirdOneViewController alloc] init];
    thirdOne.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:thirdOne animated:YES];
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
