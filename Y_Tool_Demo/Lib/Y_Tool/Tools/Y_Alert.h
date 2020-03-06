#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Y_Alert : NSObject
+ (void)alertWithTitle:(NSString *)title close:(void (^)(UIAlertAction * action))close;
@end

NS_ASSUME_NONNULL_END
