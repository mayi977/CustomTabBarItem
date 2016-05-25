//
//  MyTabBarButton.m
//  MyTabBarControllerDemo
//
//  Created by Zilu.Ma on 16/5/22.
//  Copyright © 2016年 zilu.ma. All rights reserved.
//

#import "MyTabBarButton.h"

@implementation MyTabBarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//什么也没做就可以取消系统按钮的高亮状态
//- (void)setHighlighted:(BOOL)highlighted{
//    
//    //    [super setHighlighted:highlighted];
//}

- (void)setSelected:(BOOL)selected{
    
    [super setSelected:selected];
    if (selected) {
        self.backgroundColor = [UIColor orangeColor];
    }else{
        self.backgroundColor = [UIColor clearColor];
    }
}

@end
