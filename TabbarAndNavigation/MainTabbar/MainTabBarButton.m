//
//  MainTabBarButton.m
//  EducationPlatform
//
//  Created by 同筑科技 on 2017/5/12.
//  Copyright © 2017年 well. All rights reserved.
//

//image ratio 图片比例
#define TabBarButtonImageRatio 0

#import "MainTabBarButton.h"
#import "UIImage+Extensions.h"

@implementation MainTabBarButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setSubViews];
    }
    return self;
}

//初始化设置
-(void)setSubViews
{
    self.imageView.contentMode = UIViewContentModeBottom;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:17 weight:2];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithRed:19/255.0 green:76/255.0 blue:135/255.0 alpha:1.0]] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithRed:1/255.0 green:127/255.0 blue:204/255.0 alpha:1.0]] forState:UIControlStateSelected];
}

//重写该方法可以去除长按按钮时出现的高亮效果
- (void)setHighlighted:(BOOL)highlighted
{
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height*TabBarButtonImageRatio;
    
    return CGRectMake(0, 0, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height*TabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    
    return CGRectMake(0, titleY, titleW, titleH);
}


-(void)setTabBarItem:(UITabBarItem *)tabBarItem
{
    _tabBarItem = tabBarItem;
    [self setTitle:self.tabBarItem.title forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.image forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.selectedImage forState:UIControlStateSelected];
}



@end
