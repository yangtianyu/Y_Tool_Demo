#import "NSDictionary+Y.h"

@implementation NSDictionary (Y)

+ (NSDictionary *)Y_dictionaryWithJSONString:(NSString *)json{
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    return [self Y_dictionaryWithJSONData:data];
}

+ (NSDictionary *)Y_dictionaryWithJSONData:(NSData *)json{
    NSDictionary *rst = nil;
    NSError *err = nil;
    if (json == nil || ![json isKindOfClass:[NSData class]]) {
        return nil;
    }
    id obj = [NSJSONSerialization JSONObjectWithData:json options:0 error:&err];
    if ([obj isKindOfClass:[NSDictionary class]]){
        rst = obj;
    }
    return rst;
}

- (NSString *)Y_getJsonString{
    NSString *rst = nil;
    NSError *err = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:&err];
    if (data.length > 0 && err == nil) {
        rst = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    }
    return rst;
}

- (NSString *)Y_stringForKey:(NSString *)key{
    return [self Y_stringForKey:key def:@""];
}

- (NSString *)Y_stringForKey:(NSString *)key def:(NSString *)def{
    id rst = [self objectForKey:key];
    if ([rst isKindOfClass:[NSNumber class]]){
        rst = [rst stringValue];
    }else if ([rst isKindOfClass:[NSArray class]]){
        NSMutableString *buf = [[NSMutableString alloc]init];
        for (id val in rst) {
            if ([val isKindOfClass:[NSString class]]){
                if (buf.length > 0) [buf appendString:@"\n\r"];
                [buf appendString:val];
            }
        }
        rst = [NSString stringWithString:buf];
    }else if (![rst isKindOfClass:[NSString class]]) {
        rst = nil;
    }
    if (!rst) rst = def;
    return rst;
}

- (int)Y_intForKey:(id)key{
    return [self Y_intForKey:key defaultValue:0];
}

- (int)Y_intForKey:(id)key defaultValue:(int)def{
    int rst = def;
    id val = [self objectForKey:key];
    if (val){
        if (![val isKindOfClass:[NSNull class]]) rst = [val intValue];
    }
    return rst;
}

- (double)Y_doubleForKey:(id)key{
    return [self Y_doubleForKey:key defaultValue:0.0];
}

- (double)Y_doubleForKey:(id)key defaultValue:(double)def{
    double rst = def;
    id val = [self objectForKey:key];
    if (val){
        if (![val isKindOfClass:[NSNull class]]) rst = [val doubleValue];
    }
    return rst;
}

- (BOOL)Y_boolForKey:(id)key{
    return [self Y_boolForKey:key defaultValue:FALSE];
}

- (BOOL)Y_boolForKey:(id)key defaultValue:(BOOL)def{
    BOOL rst = def;
    id val = [self objectForKey:key];
    if (val){
        if ([val isKindOfClass:[NSNull class]]){
            rst = def;
        }else if ([val isKindOfClass:[NSNumber class]]){
            rst = [val boolValue];
        }else if ([val isKindOfClass:[NSString class]]){
            rst = [val boolValue];
        }
    }
    return rst;
}

- (NSDictionary *)Y_dictForKey:(id)key{
    NSDictionary *rst = nil;
    if ([self.allKeys containsObject:key]){
        id val = [self objectForKey:key];
        if (val){
            if ([val isKindOfClass:[NSDictionary class]]) rst = val;
        }
    }
    return rst;
}

- (NSArray *)Y_arrayForKey:(id)key{
    NSArray *rst = nil;
    if ([self.allKeys containsObject:key]){
        id val = [self objectForKey:key];
        if (val){
            if ([val isKindOfClass:[NSArray class]]) rst = val;
        }
    }
    return rst;
}

- (NSArray *)Y_arrayForKeyEx:(id)key{
    NSArray *rst = nil;
    id val = [self objectForKey:key];
    if (val){
        if ([val isKindOfClass:[NSArray class]]) {
            rst = val;
        }else if ([val isKindOfClass:[NSDictionary class]]) {
            NSDictionary *infos = val;
            rst = infos.allValues;
        }
    }
    return rst;
}

- (NSDictionary *)objectFromJSONString{
    return self;
}

@end
