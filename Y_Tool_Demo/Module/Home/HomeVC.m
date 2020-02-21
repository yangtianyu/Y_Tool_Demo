//
//  HomeVC.m
//  Y_Tool_Demo
//
//  Created by ty.yang on 2019/12/27.
//  Copyright © 2019 ty.yang. All rights reserved.
//

#import "HomeVC.h"
#import "ListVC.h"
#import "Y_Storage.h"
#import "MBProgressHUD.h"

@interface HomeVC ()

@end

@implementation HomeVC
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
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = Y_RandomColor;
    Y_Button * testBtn = [Y_Button buttonWithFrame:CGRectMake(0, 0, 50, 50) callBack:^(Y_Button *sender) {
//        ListVC * testVC = [[ListVC alloc] init];
//        testVC.title = @"testVC";
//        testVC.view.backgroundColor = Y_RandomColor;
//        [self.navigationController pushViewController:testVC animated:YES];
    }];
    testBtn.backgroundColor = Y_RandomColor;
    [self.view addSubview:testBtn];
    
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
