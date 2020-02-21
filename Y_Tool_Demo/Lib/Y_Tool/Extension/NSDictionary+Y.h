#import <Foundation/Foundation.h>

@interface NSDictionary (Y)
+ (NSDictionary *)Y_dictionaryWithJSONString:(NSString *)json;
+ (NSDictionary *)Y_dictionaryWithJSONData:(NSData *)json;
- (NSString *)Y_getJsonString;

- (NSString *)Y_stringForKey:(NSString *)key;
- (NSString *)Y_stringForKey:(NSString *)key def:(NSString *)def;

- (int)Y_intForKey:(id)key;
- (int)Y_intForKey:(id)key defaultValue:(int)def;

- (double)Y_doubleForKey:(id)key;
- (double)Y_doubleForKey:(id)key defaultValue:(double)def;

- (BOOL)Y_boolForKey:(id)key;
- (BOOL)Y_boolForKey:(id)key defaultValue:(BOOL)def;

- (NSDictionary *)Y_dictForKey:(id)key;

- (NSArray *)Y_arrayForKey:(id)key;

- (NSArray *)Y_arrayForKeyEx:(id)key;

- (NSDictionary *)objectFromJSONString;

@end

@interface NSMutableDictionary (Y)

- (void)Y_setCoderObject:(id<NSCoding>)obj forKey:(id)key;
- (id)Y_coderObjectForKey:(id)key;

@end
