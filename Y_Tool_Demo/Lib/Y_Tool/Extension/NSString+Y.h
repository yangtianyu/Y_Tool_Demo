#import <Foundation/Foundation.h>

@interface NSString (Y)
- (NSString *)Y_urlEncode;
- (NSString *)Y_urlDecode;

- (BOOL)Y_isContainsString:(NSString *)string;
- (BOOL)Y_isContainsStringIgnoreCase:(NSString *)string;
@end
