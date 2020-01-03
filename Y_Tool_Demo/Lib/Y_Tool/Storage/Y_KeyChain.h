#import <Foundation/Foundation.h>

@interface Y_KeyChain : NSObject
+ (BOOL)saveValue:(id)value forKey:(NSString*)key forAccessGroup:(NSString *)group;
+ (BOOL)saveValue:(id)value forKey:(NSString*)key;
+ (BOOL)deleteValueForKey:(NSString *)key forAccessGroup:(NSString *)group;
+ (BOOL)deleteValueForKey:(NSString *)key;
+ (id)loadValueForKey:(NSString*)key forAccessGroup:(NSString *)group;
+ (id)loadValueForKey:(NSString*)key;
@end
