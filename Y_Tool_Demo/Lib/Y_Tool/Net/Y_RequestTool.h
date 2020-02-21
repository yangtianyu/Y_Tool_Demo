#import <UIKit/UIKit.h>

typedef void (^SuccessBlock)(NSDictionary *dict);
typedef void (^FailureBlock)(NSString *error);

@interface Y_RequestTool : NSObject

/**
 GET请求
 */
+ (NSURLSessionDataTask *)GET:(NSString *)URL SuccessBlock:(SuccessBlock)SuccessBlock FailureBlock:(FailureBlock)FailureBlock;

/**
 POST请求字符串
 */
+ (NSURLSessionDataTask *)POST:(NSString *)URL TEXT:(NSString *)TEXT SuccessBlock:(SuccessBlock)SuccessBlock FailureBlock:(FailureBlock)FailureBlock;
/**
 获得当前网络状态
 */
+ (BOOL)getNetStatus;
@end
