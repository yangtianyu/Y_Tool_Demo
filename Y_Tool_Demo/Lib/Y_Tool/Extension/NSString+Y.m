#import "NSString+Y.h"

@implementation NSString (Y)

- (NSString *)Y_urlEncode{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (NSString *)Y_urlDecode{
    return [self stringByRemovingPercentEncoding];
}

- (BOOL)Y_isContainsString:(NSString *)string{
    if (string.length == 0) {
        return NO;
    }
    return !NSEqualRanges([self rangeOfString:string], NSMakeRange(NSNotFound, 0));
}

- (BOOL)Y_isContainsStringIgnoreCase:(NSString *)string{
    return [[self uppercaseString] Y_isContainsString:[string uppercaseString]];
}

@end

