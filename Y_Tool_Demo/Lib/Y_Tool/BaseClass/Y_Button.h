#import <UIKit/UIKit.h>

@interface Y_Button : UIButton
typedef void(^callBack)(Y_Button * sender);
+ (instancetype)buttonWithFrame:(CGRect)frame callBack:(callBack)callBack;
@end
