#import <Foundation/Foundation.h>
#import "Y_XXTEA.h"

@interface Y_Encrypt : NSObject

/**
 MD5加密
 */
+ (NSString *)MD5:(NSString *)string;

/**
 XXTEA加密
 */
+ (NSString *)XXTEA_encryptStringToBase64String:(NSString *)data stringKey:(NSString *)key;

/**
 XXTEA解密
 */
+ (NSString *)XXTEA_decryptBase64StringToString:(NSString *)data stringKey:(NSString *)key;
@end
