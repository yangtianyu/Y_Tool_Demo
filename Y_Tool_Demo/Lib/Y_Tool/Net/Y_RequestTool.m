#import "Y_RequestTool.h"
#import "Y_Encrypt.h"

@implementation Y_RequestTool

+ (NSURLSessionDataTask *)GET:(NSString *)URL SuccessBlock:(SuccessBlock)SuccessBlock FailureBlock:(FailureBlock)FailureBlock{
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [self getRequest:URL];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                if (![self getNetStatus]) {
                    !FailureBlock ? : FailureBlock(@"网络异常");
                }else{
                    if ([error.userInfo valueForKey:@"NSLocalizedDescription"] != nil) {
                        !FailureBlock ? : FailureBlock([NSString stringWithFormat:@"%@",[error.userInfo valueForKey:@"NSLocalizedDescription"]]);
                    }else{
                        !FailureBlock ? : FailureBlock([NSString stringWithFormat:@"%@",error.userInfo]);
                    }
                }
            }else{
                NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSNumber * error = [dict valueForKey:@"error"];
                NSString * errormsg = [dict valueForKey:@"errormsg"];
                NSDictionary * dataDict = [dict valueForKey:@"data"];
                if ([error isEqualToNumber:@1] && [dataDict isKindOfClass:NSDictionary.class] && dataDict) {
                    !SuccessBlock ? : SuccessBlock(dataDict);
                }else{
                    if ([errormsg isKindOfClass:NSString.class] && errormsg.length > 0) {
                        !FailureBlock ? : FailureBlock(errormsg);
                    }else{
                        !FailureBlock ? : FailureBlock(@"请求异常");
                    }
                }
            }
        });
    }];
    [dataTask resume];
    return dataTask;
}

+ (NSURLSessionDataTask *)POST:(NSString *)URL TEXT:(NSString *)TEXT SuccessBlock:(SuccessBlock)SuccessBlock FailureBlock:(FailureBlock)FailureBlock{
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [self getRequest:URL];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [TEXT dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                if (![self getNetStatus]) {
                    !FailureBlock ? : FailureBlock(@"网络异常");
                }else{
                    if ([error.userInfo valueForKey:@"NSLocalizedDescription"] != nil) {
                        !FailureBlock ? : FailureBlock([NSString stringWithFormat:@"%@",[error.userInfo valueForKey:@"NSLocalizedDescription"]]);
                    }else{
                        !FailureBlock ? : FailureBlock([NSString stringWithFormat:@"%@",error.userInfo]);
                    }
                }
            }else{
                NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSNumber * error = [dict valueForKey:@"error"];
                NSString * errormsg = [dict valueForKey:@"errormsg"];
                NSDictionary * dataDict = [dict valueForKey:@"data"];
                if ([error isEqualToNumber:@0] && dataDict && [dataDict isKindOfClass:NSDictionary.class]) {
                    !SuccessBlock ? : SuccessBlock(dataDict);
                }else{
                    if ([errormsg isKindOfClass:NSString.class] && errormsg.length > 0) {
                        !FailureBlock ? : FailureBlock(errormsg);
                    }else{
                        !FailureBlock ? : FailureBlock(@"请求异常");
                    }
                }
            }
        });
    }];
    [dataTask resume];
    return dataTask;
}
+ (NSMutableURLRequest *)getRequest:(NSString *)URLString{
    NSURL * URL = [NSURL URLWithString:URLString];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:URL];
//    request.timeoutInterval = 30.0;
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Contsetent-Type"];
    return request;
}
+ (BOOL)getNetStatus{
    // 状态栏是由当前app控制的，首先获取当前app
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    int type = 0;
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
        }
    }
    switch (type) {
        case 1:
            //            return @"2G";
            break;
        case 2:
            //            return @"3G";
            break;
        case 3:
            //            return @"4G";
            break;
        case 5:
            //            return @"WIFI";
            break;
        default:
            //            return @"NO-WIFI";//代表未知网络
            return NO;
            break;
    }
    return YES;
}
@end

