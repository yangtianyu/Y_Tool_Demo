#import "Y_Button.h"

@interface Y_Button ()
@property (nonatomic , copy) callBack callBack;
@property (nonatomic, weak) Y_Button * j;
@end

@implementation Y_Button
+ (instancetype)buttonWithFrame:(CGRect)frame callBack:(callBack)callBack{
    Y_Button * button = [Y_Button buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button addTarget:button action:@selector(btnClickAction:) forControlEvents:UIControlEventTouchUpInside];
    button.callBack = callBack;
    return button;
}
- (void)btnClickAction:(Y_Button *)sender{
    __weak typeof(self) weakself = self;
    !weakself.callBack?:weakself.callBack(sender);
}
@end
