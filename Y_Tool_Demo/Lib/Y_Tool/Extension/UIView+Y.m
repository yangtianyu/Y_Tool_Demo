#import "UIView+Y.h"
#import "Y_Define.h"

@implementation UIView (UIView)

#pragma mark ---------------- Setters-----------------
- (void)setX_Y:(CGFloat)x_Y{
    CGRect r        = self.frame;
    r.origin.x      = x_Y;
    self.frame      = r;
}

- (void)setY_Y:(CGFloat)y_Y{
    CGRect r        = self.frame;
    r.origin.y      = y_Y;
    self.frame      = r;
}

- (void)setWidth_Y:(CGFloat)width_Y{
    CGRect r        = self.frame;
    r.size.width    = width_Y;
    self.frame      = r;
}

- (void)setHeight_Y:(CGFloat)height_Y{
    CGRect r        = self.frame;
    r.size.height   = height_Y;
    self.frame      = r;
}

- (void)setOrigin_Y:(CGPoint)origin_Y{
    CGRect r        = self.frame;
    r.origin        = origin_Y;
    self.frame      = r;
}

- (void)setSize_Y:(CGSize)size_Y{
    CGRect r        = self.frame;
    r.size          = size_Y;
    self.frame      = r;
}

- (void)setTop_Y:(CGFloat)top_Y{
    CGRect r = self.frame;
    r.origin.y = top_Y;
    self.frame = r;
}

- (void)setLeft_Y:(CGFloat)left_Y{
    CGRect r = self.frame;
    r.origin.x = left_Y;
    self.frame = r;
}

- (void)setBottom_Y:(CGFloat)bottom_Y{
    CGRect r = self.frame;
    r.origin.y = bottom_Y - r.size.height;
    self.frame = r;
}

- (void)setRight_Y:(CGFloat)right_Y{
    CGRect r = self.frame;
    r.origin.x = right_Y - r.size.width;
    self.frame = r;
}

- (void)setCenter_Y:(CGPoint)center_Y{
    self.center = center_Y;
}

- (void)setCenterX_Y:(CGFloat)centerX_Y{
    self.center = CGPointMake(centerX_Y, self.center.y);
}

- (void)setCenterY_Y:(CGFloat)centerY_Y{
    self.center = CGPointMake(self.center.x, centerY_Y);
}

#pragma mark ---------------- Getters-----------------
- (CGFloat)x_Y{
    return self.frame.origin.x;
}

- (CGFloat)y_Y{
    return self.frame.origin.y;
}

- (CGFloat)width_Y{
    return self.frame.size.width;
}

- (CGFloat)height_Y{
    return self.frame.size.height;
}

- (CGPoint)origin_Y{
    return self.frame.origin;
}

- (CGSize)size_Y{
    return self.frame.size;
}

- (CGFloat)top_Y{
    return self.frame.origin.y;
}

- (CGFloat)left_Y{
    return self.frame.origin.x;
}

- (CGFloat)bottom_Y{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)right_Y{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGPoint)center_Y{
    return self.center;
}

- (CGFloat)centerX_Y{
    return self.center.x;
}

- (CGFloat)centerY_Y{
    return self.center.y;
}

#pragma mark -
#pragma mark ============== Function ==============
/// 移除子视图
- (void)Y_removeAllSubviews{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}
- (void)Y_removeFromSuperView{
    [self removeFromSuperview];
}

- (UIViewController *)Y_getCurrentViewController{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}


+ (void)Y_showTestTextView:(NSString *)textStr{
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 64, Y_ScreenWidth, 400)];
    textView.backgroundColor = Y_RedColor;
    textView.text = textStr;
    [Y_KeyWindow addSubview:textView];
}

@end
