//
//  MainTabBarController.m
//  Yiyan_cjzgz
//
//  Created by 陈静 on 16/5/26.
//  Copyright © 2016年 CJZGZ. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _lovdeSubviewCtrls];
    [self _createCustomTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)_lovdeSubviewCtrls{
    NSArray *storyboardName = @[@"Home", @"Maidan", @"Message", @"Personal"];
    
    NSMutableArray *navs = [NSMutableArray array];
    
    for (NSString *name in storyboardName) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
        
        UINavigationController *nav = [storyboard instantiateInitialViewController];
        
        [navs addObject:nav];
    }
    
    self.viewControllers = navs;
    
}
- (void)_createCustomTabBar{
    
    for (UIView *view in self.tabBar.subviews) {
        
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            [view removeFromSuperview];
        }
    }
    CGFloat with = [UIScreen mainScreen].bounds.size.width / 5;
    
    NSArray *arr = @[@"Home1-64-littlegray",
                     @"Search Filled-64-littlegray",
                     @"home_tab_icon_3.png",
                     @"User-64-littlegray",
                     @"Plus Math-64-gray"];
    for (NSInteger i = 0; i < 5; i++) {
        
        UIButton *button = [[UIButton  alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        
        button.center = CGPointMake(i*with + with / 2, 40/2);
        
        [button setImage:[UIImage imageNamed:arr[i]]forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        button.tag = i;
        
        [self.tabBar addSubview:button];
        
    }
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"mask_navbar.png"]];
    
    //    ThemeImageView *tabBarImageView = [[ThemeImageView alloc] initWithFrame:self.tabBar.bounds];
    //
    //    tabBarImageView.imgName = @"mask_navbar.png";
    //
    //    [self.tabBar insertSubview:tabBarImageView atIndex:0];
    //
    //
    //    _selectImage = [[ThemeImageView alloc] initWithFrame:CGRectMake(0, 0, with, kTabbarHeight)];
    //
    //    _selectImage.imgName = @"home_bottom_tab_arrow.png";
    //
    //    [self.tabBar addSubview:_selectImage];
    
    
}
- (void)buttonAction:(UIButton *)button{
    
    self.selectedIndex = button.tag;
    
    [UIView animateWithDuration:0.3 animations:^{
        
    }];
    
}@end
