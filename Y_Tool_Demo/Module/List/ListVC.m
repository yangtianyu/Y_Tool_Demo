//
//  ListVC.m
//  Y_Tool_Demo
//
//  Created by ty.yang on 2019/12/27.
//  Copyright © 2019 ty.yang. All rights reserved.
//

#import "ListVC.h"
#import "ListVCModel.h"
#import "ChartVC.h"
#import "AnimationVC.h"


@interface ListVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation ListVC
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
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:self.tableView];
}
- (void)initData{
    NSArray * arr = @[
        @{
            @"title":@"Chart",
            @"url":@"Chart",
        },
        @{
            @"title":@"Animation",
            @"url":@"Animation",
        },
    ];
    NSMutableArray * arrM = @[].mutableCopy;
    for (NSDictionary * dict in arr) {
        ListVCModel * model = [[ListVCModel alloc] initWithDict:dict];
        [arrM addObject:model];
    }
    self.dataArr = arrM.copy;
    [self.tableView reloadData];
}
#pragma mark -
#pragma mark ============== UpdateUI ==============

#pragma mark -
#pragma mark ============== Event ==============
- (void)chartVCbackBarButtonItemAction:(UIBarButtonItem *)sender{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}
- (void)animationVCVCbackBarButtonItemAction:(UIBarButtonItem *)sender{
    [self.navigationController.viewControllers.lastObject popoverPresentationController];
}
#pragma mark -
#pragma mark ============== InterTool ==============

#pragma mark -
#pragma mark ============== API ==============
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return self.dataArr.count;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 60;
    }
    return 100;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"UITableViewHeaderFooterView"];
    if(!view){
        view = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:@"UITableViewHeaderFooterView"];
    }
    view.textLabel.text = [NSString stringWithFormat:@"%ld",section];
    return view;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = nil;
    if(indexPath.section == 0){
        ListVCModel * model = self.dataArr[indexPath.row];
        cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"%@",model.title];
    }
    if(!cell){
        cell = [[UITableViewCell alloc] init];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ListVCModel * model = nil;
    if(indexPath.section == 0){
        if(indexPath.row == 0){
            model = self.dataArr[indexPath.row];
            ChartVC * chartVC = [[ChartVC alloc] init];
            chartVC.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(chartVCbackBarButtonItemAction:)];
            Y_BaseNavigationViewController * navVC = [[Y_BaseNavigationViewController alloc] initWithRootViewController:chartVC];
            navVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:navVC animated:YES completion:nil];
        }
       if(indexPath.row == 1){
           model = self.dataArr[indexPath.row];
           AnimationVC * animationVC = [[AnimationVC alloc] init];
           animationVC.hidesBottomBarWhenPushed = YES;
           animationVC.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(animationVCVCbackBarButtonItemAction:)];
           [self.navigationController pushViewController:animationVC animated:YES];
       }
    }
}
#pragma mark -
#pragma mark ============== Request ==============

#pragma mark -
#pragma mark ============== Notify&CallBack ==============

#pragma mark -
#pragma mark ============== Getting&Setting ==============
@end


