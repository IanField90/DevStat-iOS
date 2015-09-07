//
//  CustomTabBarController.m
//  DevStat
//
//  Created by Ian Field on 07/09/2015.
//  Copyright (c) 2015 Ian Field. All rights reserved.
//

#import "CustomTabBarController.h"
#import "Constants.h"
#import <MNFloatingActionButton/MNFloatingActionButton.h>

const CGFloat kFABDiameter = 50;

@interface CustomTabBarController ()

@property (nonatomic, strong) MNFloatingActionButton *button;

@end

@implementation CustomTabBarController

- (void)dealloc
{
    _button = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.button = [[MNFloatingActionButton alloc] init];
    self.button.backgroundColor = kDSPurple;
    self.button.centerImageView.image = [UIImage imageNamed:@"ic_share"];
    self.button.animationScale = 1.10f;
    [self.view addSubview:self.button];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat baseline = self.tabBar.frame.size.height;
    CGFloat originY = self.view.frame.size.height - baseline - 65;
    CGFloat originX = (self.view.frame.size.width - kFABDiameter) / 2;
    
    self.button.frame = CGRectMake(originX, originY, kFABDiameter, kFABDiameter);
}

@end
