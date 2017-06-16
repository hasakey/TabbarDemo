//
//  MainTabBarController.m
//  EducationPlatform
//
//  Created by 同筑科技 on 2017/5/12.
//  Copyright © 2017年 well. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "PersonViewController.h"
#import "ExamViewController.h"
#import "CourseViewController.h"
#import "MessageViewController.h"
#import "MainTabBar.h"
#import "MainTabBarButton.h"


@interface MainTabBarController ()<MainTabBarDelegate>

@property(nonatomic, strong)MainTabBar *mainTabBar;

@end

@implementation MainTabBarController

-(MainTabBar *)mainTabBar
{
    if (!_mainTabBar) {
        _mainTabBar = [[MainTabBar alloc] initWithFrame:self.tabBar.bounds];
        _mainTabBar.delegate = self;
        _mainTabBar.backgroundColor = [UIColor colorWithRed:19/255.0 green:76/255.0 blue:135/255.0 alpha:1.0];
    }
    return _mainTabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar addSubview:self.mainTabBar];
    [self SetupAllControllers];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)SetupAllControllers{

    [self SetupChildVc:[[CourseViewController alloc] init] title:@"红" image:@"" selectedImage:@""];
    [self SetupChildVc:[[ExamViewController alloc] init] title:@"绿" image:@"" selectedImage:@""];
    [self SetupChildVc:[[MessageViewController alloc] init] title:@"红" image:@"" selectedImage:@""];
    [self SetupChildVc:[[PersonViewController alloc] init] title:@"绿" image:@"" selectedImage:@""];
    
}

- (void)SetupChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName{
    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:childVc];
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.title = title;
    [self.mainTabBar addTabBarButtonWithTabBarItem:childVc.tabBarItem];
    [self addChildViewController:nav];
} 



#pragma mark MainTabBar delegate
- (void)tabBar:(MainTabBar *)tabBar didSelectedButtonFrom:(long)fromBtnTag to:(long)toBtnTag{
    self.selectedIndex = toBtnTag;
    
    //点击tabbarButton的时候返回root
    NSArray *navArray = self.childViewControllers;
    if (navArray.count > 0) {
        MainNavigationController *nav = self.childViewControllers[toBtnTag];
        [nav popToRootViewControllerAnimated:NO];
    }

}


@end
