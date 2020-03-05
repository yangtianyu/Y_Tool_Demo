#import "Y_Alert.h"
#import "Y_Define.h"
@implementation Y_Alert
+ (void)alertWithTitle:(NSString *)title close:(void (^)(UIAlertAction * action))close{
    UIAlertController * alertC = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        !close ?: close(action);
    }]];
    UIViewController * vc = [Y_KeyWindow rootViewController];
    [vc presentViewController:alertC animated:YES completion:nil];
}
@end
