#import "ChartVC.h"
#import "ChartView.h"
@interface ChartVC ()
@property (nonatomic, strong) ChartView * chartView;
@end

@implementation ChartVC
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
    self.title = self.title?:@"ChartVC";
    self.chartView = [[ChartView alloc] initWithFrame:self.view.bounds];
    self.chartView.backgroundColor = Y_WhiteColor;
    [self.view addSubview:self.chartView];
    __weak typeof(self) weakself = self;
    Y_Button * btn = [Y_Button buttonWithFrame:CGRectZero callBack:^(Y_Button *sender) {
        [weakself.chartView setNeedsDisplay];
    }];
    [btn setTitle:@"点击绘制" forState:0];
    [btn setBackgroundColor:Y_BlackColor];
    [btn sizeToFit];
    [self.view addSubview:btn];
//    self.navigationItem.leftBarButtonItems = @[
//        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backBarButtonItemAction:)],
//    ];
}
- (void)initData{
}
#pragma mark -
#pragma mark ============== UpdateUI ==============

#pragma mark -
#pragma mark ============== Event ==============
- (void)backBarButtonItemAction:(UIBarButtonItem *)sender{
}
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

