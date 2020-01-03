//
//  RootViewController.m
//  Y_Tool_Demo
//
//  Created by ty.yang on 2019/12/27.
//  Copyright © 2019 ty.yang. All rights reserved.
//

#import "RootTabBarC.h"
#import "MainTabBarC.h"

@interface RootTabBarC ()

@end

@implementation RootTabBarC
#pragma mark -
#pragma mark ============== VCLifecycle ==============
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)dealloc{
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self initView];
    [self initData];
}
- (void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tabBar setHidden:YES];
    MainTabBarC * rootTabBarC = [[MainTabBarC alloc] init];
    UINavigationController * NAVC = [[UINavigationController alloc] initWithRootViewController:rootTabBarC];
    [NAVC setNavigationBarHidden:YES];
    [self addChildViewController:NAVC];
}
- (void)initData{
}
#pragma mark -
#pragma mark ============== UpdateUI ==============

#pragma mark -
#pragma mark ============== Event ==============

#pragma mark -
#pragma mark ============== InterTool ==============

#pragma mark -
#pragma mark ============== API ==============

#pragma mark -
#pragma mark ============== Request ==============

#pragma mark -
#pragma mark ============== Notify&CallBack ==============

#pragma mark -
#pragma mark ============== Getting&Setting ==============

@end
