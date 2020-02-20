#import "Y_BaseModel.h"

@implementation Y_BaseModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        [self initializeWithDict:dict];
    }
    return self;
}
- (void)initializeWithDict:(NSDictionary *)dict {
    [self setValuesForKeysWithDictionary:dict];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
}
@end
