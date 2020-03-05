#import <UIKit/UIKit.h>

@interface UIView (UIView)
@property (nonatomic, assign) CGFloat x_Y;
@property (nonatomic, assign) CGFloat y_Y;
@property (nonatomic, assign) CGFloat width_Y;
@property (nonatomic, assign) CGFloat height_Y;
@property (nonatomic, assign) CGPoint origin_Y;
@property (nonatomic, assign) CGSize  size_Y;
@property (nonatomic, assign) CGFloat top_Y;
@property (nonatomic, assign) CGFloat left_Y;
@property (nonatomic, assign) CGFloat bottom_Y;
@property (nonatomic, assign) CGFloat right_Y;
@property (nonatomic, assign) CGPoint center_Y;
@property (nonatomic, assign) CGFloat centerX_Y;
@property (nonatomic, assign) CGFloat centerY_Y;

/// 移除子视图
- (void)Y_removeAllSubviews;
/// 从父视图移除
- (void)Y_removeFromSuperView;

/// 获得当前视图的控制器
- (UIViewController *)Y_getCurrentViewController;

/// 展示一个textView到window顶部
+ (void)Y_showTestTextView:(NSString *)textStr;

- (void)Y_radius:(CGFloat)redius;

@end
