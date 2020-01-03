#import "Y_Encrypt.h"
#import <CommonCrypto/CommonDigest.h>
@implementation Y_Encrypt

/**
 MD5加密
 */
+ (NSString *)MD5:(NSString *)string{
    const char *original_str = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

/**
 XXTEA加密
 */
+ (NSString *)XXTEA_encryptStringToBase64String:(NSString *)data stringKey:(NSString *)key{
    return [Y_XXTEA encryptStringToBase64String:data stringKey:key];
}

/**
 XXTEA解密
 */
+ (NSString *)XXTEA_decryptBase64StringToString:(NSString *)data stringKey:(NSString *)key{
    return [Y_XXTEA decryptBase64StringToString:data stringKey:key];
}
@end
