#import "Y_HUD.h"
#import "Y_Define.h"
#import "MBProgressHUD.h"

@implementation Y_HUD

+ (void)showLoading{
    [MBProgressHUD showHUDAddedTo:Y_KeyWindow animated:YES];
}

+ (void)hideLoading{
    [MBProgressHUD hideHUDForView:Y_KeyWindow animated:YES];
}

+ (void)showTitle:(NSString *)title desc:(NSString *)desc CB:(void (^)(void))CB{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:Y_KeyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = title;
    hud.detailsLabel.text = desc;
    hud.completionBlock = ^{!CB ?: CB();};
    [hud hideAnimated:YES afterDelay:1.618];
}



@end
