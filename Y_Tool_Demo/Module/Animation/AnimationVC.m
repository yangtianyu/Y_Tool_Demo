#import "AnimationVC.h"
@interface AnimationVC ()
@property (nonatomic, strong) UIView *selectedView;
@property (nonatomic, strong) UIView *testView;
@property (nonatomic, strong) CALayer *testLayer;
@end

@implementation AnimationVC

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
    self.title = @"AnimationVC";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = Y_WhiteColor;
    self.selectedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width_Y, 50)];
    self.selectedView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.selectedView];
    NSArray * typeArr = @[@"关键帧",@"2",@"3",@"4",];
    for (NSInteger i = 0; i < typeArr.count; i++) {
        NSString * type = typeArr[i];
        CGFloat w = self.selectedView.width_Y / typeArr.count;
        UIView * v = [[UIView alloc] initWithFrame:CGRectMake(i * w, 0, w, self.selectedView.height_Y)];
        v.backgroundColor = Y_RandomColor;
        [self.selectedView addSubview:v];
        UILabel * lab = [[UILabel alloc] initWithFrame:v.bounds];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.text = type;
        [v addSubview:lab];
        __weak typeof(self) weakself = self;
        Y_Button * btn = [Y_Button buttonWithFrame:v.bounds callBack:^(Y_Button *sender) {
            Y_Log(@"%@",type);
        }];
        [v addSubview:btn];
    }
    
    self.testView = [UIView new];
    [self.view addSubview:self.testView];
    self.testView.backgroundColor = Y_RedColor;
    self.testView.frame = CGRectMake(0, 100, 50, 50);
    
    self.testLayer = [CALayer new];
    [self.view.layer addSublayer:self.testLayer];
    self.testLayer.backgroundColor = Y_BlueColor.CGColor;
    self.testLayer.bounds = CGRectMake(0, 0, 50, 50);
    self.testLayer.position = self.view.center;
}
- (void)initData{
}
#pragma mark -
#pragma mark ============== UpdateUI ==============

#pragma mark -
#pragma mark ============== Event ==============
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    self.testLayer.position = point;
        CGFloat WH = arc4random_uniform(100);
    if (WH < 20) {
        WH += 50;
    }
    self.testLayer.bounds = CGRectMake(0, 0, WH, WH);
    UIColor *color = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1.f];
    self.testLayer.backgroundColor = color.CGColor;//修改背景色的隐式动画
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    self.testLayer.position = point;
        CGFloat WH = arc4random_uniform(100);
    if (WH < 20) {
        WH += 50;
    }
    self.testLayer.bounds = CGRectMake(0, 0, WH, WH);
    UIColor *color = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1.f];
    self.testLayer.backgroundColor = color.CGColor;//修改背景色的隐式动画
//    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
//    positionAnimation.fromValue = [NSValue valueWithCGPoint:self.testView.layer.presentationLayer.position];
//    positionAnimation.toValue = [NSValue valueWithCGPoint:point];
//    positionAnimation.duration = 1.f;//动画时长
//    positionAnimation.removedOnCompletion = NO;//是否在完成时移除
//    positionAnimation.fillMode = kCAFillModeForwards;//动画结束后是否保持状态
//    [self.testView.layer addAnimation:positionAnimation forKey:@"positionAnimation"];
//    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:0.1 options:0 animations:^{
//        self.testView.center_Y = point;
//    } completion:^(BOOL finished) {
//
//    }];
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
