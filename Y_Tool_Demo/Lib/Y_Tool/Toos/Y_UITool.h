#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Y_UITool : NSObject

///// 在drawRect外获得一块ContextRef block已处理了内存
//+ (void)getContextRefWithRectSize:(CGSize)rectSize action:(void (^)(CGContextRef contextRef))action;
//
//+ (void)Y_cutView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
