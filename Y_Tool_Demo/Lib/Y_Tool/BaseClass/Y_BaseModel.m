//
//  Y_BaseModel.m
//  DataLastingDemo
//
//  Created by Main on 2017/3/31.
//  Copyright © 2017年 Main. All rights reserved.
//

#import "Y_BaseModel.h"

@implementation Y_BaseModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        if ([dict isKindOfClass:[NSDictionary class]]) {
            [self initializeWithDict:dict];
        }
    }
    return self;
}
- (void)initializeWithDict:(NSDictionary *)dict {
    [self setValuesForKeysWithDictionary:dict];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
}
@end
