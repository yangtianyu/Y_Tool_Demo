#import "Y_UITool.h"
#import "Y_Define.h"
#import "Y_BaseChartView.h"
#import "UIView+Y.h"

@implementation Y_UITool

+ (void)getContextRefWithRectSize:(CGSize)rectSize action:(void (^)(CGContextRef contextRef))action{
    UIGraphicsBeginImageContextWithOptions(rectSize, true, Y_MainScreen.scale);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    !action ?: action(contextRef);
    UIGraphicsEndImageContext();
}

+ (void)Y_cutView:(UIView *)view{
    UIImageView *imgView = [[UIImageView alloc] init];
//    imgView.opaque = false;
    imgView.frame = view.bounds;
    [view addSubview:imgView];
    imgView.image = [Y_UITool drawRectlineWidth:0 lineColor:Y_BlueColor fillColor:Y_BlueColor radius:Y_HALF(view.width_Y) rect:view.bounds];
//    [view layoutIfNeeded];
//    [view setNeedsDisplay];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [Y_UITool getContextRefWithRectSize:view.bounds.size action:^(CGContextRef  _Nonnull contextRef) {
//
//            [view setNeedsDisplay];
////            UIImageView *imgView = [[UIImageView alloc] init];
////            [view addSubview:imgView];
////            UIImage * antiRoundedCornerImage = UIGraphicsGetImageFromCurrentImageContext();
////            imgView.image = antiRoundedCornerImage;
//        }];
//    });
}

/**
 绘制一个有圆角有填充颜色的矩形
 */
+ (UIImage *)drawRectlineWidth:(CGFloat)lineWidth
       lineColor:(UIColor*)lineColor
       fillColor:(UIColor *)fillColor
          radius:(CGFloat)radius
            rect:(CGRect)rect
{
    UIGraphicsBeginImageContextWithOptions(rect.size, false, Y_MainScreen.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, Y_ClearColor.CGColor);
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    CGContextSetLineDash(context,0,NULL,0);
    if (radius != 0) {
        CGFloat width = rect.size.width;
        CGFloat height = rect.size.height;;
        (isnan(rect.size.height)) && (height = 0);
        CGFloat x = rect.origin.x;
        CGFloat y = rect.origin.y;
        CGContextMoveToPoint(context, x+radius, y);
        CGContextAddLineToPoint(context, x+width-radius, y);
        CGContextAddArcToPoint(context, x+width, y, x+width, y+radius, radius);
        CGContextAddLineToPoint(context, x+width, y+height-radius);
        CGContextAddArcToPoint(context, x+width, y+height, x+width-radius, y+height, radius);
        CGContextAddLineToPoint(context, x+radius, y+height);
        CGContextAddArcToPoint(context, x, y+height, x, y+height-radius, radius);
        CGContextAddLineToPoint(context, x, y+radius);
        CGContextAddArcToPoint(context, x, y, x+radius, y, radius);
    }else{
        CGContextAddRect(context, rect);
    }
    CGContextDrawPath(context, kCGPathFillStroke);
    UIImage *antiRoundedCornerImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return antiRoundedCornerImage;
}

@end

