//
//  MainTabBar.h
//  EducationPlatform
//
//  Created by 同筑科技 on 2017/5/12.
//  Copyright © 2017年 well. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MainTabBarButton.h"

@class MainTabBar;

@protocol MainTabBarDelegate <NSObject>

@optional

- (void)tabBar:(MainTabBar *)tabBar didSelectedButtonFrom:(long)fromBtnTag to:(long)toBtnTag;

@end

@interface MainTabBar : UIView

- (void)addTabBarButtonWithTabBarItem:(UITabBarItem *)tabBarItem;
- (void)ClickTabBarButton:(MainTabBarButton *)tabBarBtn;
@property(nonatomic, weak)id <MainTabBarDelegate>delegate;

@end
