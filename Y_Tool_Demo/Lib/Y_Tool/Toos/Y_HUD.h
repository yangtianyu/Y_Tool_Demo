#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Y_HUD : NSObject
+ (void)showLoading;
+ (void)hideLoading;
+ (void)showTitle:(NSString *)title desc:(NSString * __nullable)desc CB:(void (^)(void))CB;
@end

NS_ASSUME_NONNULL_END
