//
//  RequestTool.h
//  SGCSDK_iOS_Demo
//
//  Created by 杨天宇 on 2017/6/8.
//  Copyright © 2017年 杨天宇. All rights reserved.
//
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
