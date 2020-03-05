#import "Y_Encrypt.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Y_Encrypt

/// MD5加密
+ (NSString *)MD5:(NSString *)string{
    const char *original_str = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

/// SHA256加密
- (NSString *)SHA256:(NSString *)string{
    const char *s = [string cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [NSData dataWithBytes:s length:strlen(s)];
    uint8_t digest[CC_SHA256_DIGEST_LENGTH] = {0};
    CC_SHA256(keyData.bytes, (CC_LONG)keyData.length, digest);
    NSData *out = [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    const unsigned *hashBytes = [out bytes];
    NSString *hash = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
    ntohl(hashBytes[0]), ntohl(hashBytes[1]), ntohl(hashBytes[2]),
    ntohl(hashBytes[3]), ntohl(hashBytes[4]), ntohl(hashBytes[5]),
    ntohl(hashBytes[6]), ntohl(hashBytes[7])];
    return hash;
}

/// XXTEA加密
+ (NSString *)XXTEA_encryptStringToBase64String:(NSString *)data stringKey:(NSString *)key{
    return [Y_XXTEA encryptStringToBase64String:data stringKey:key];
}

/// XXTEA解密
+ (NSString *)XXTEA_decryptBase64StringToString:(NSString *)data stringKey:(NSString *)key{
    return [Y_XXTEA decryptBase64StringToString:data stringKey:key];
}

@end

