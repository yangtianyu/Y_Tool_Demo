#import <UIKit/UIKit.h>

@interface Y_AppConfig : NSObject
///从Keychainz拿UUID，拿不到就生成并存起来
+ (NSString*)getUUIDFromKeychainWithBundleID:(NSString *)bundleID;
/// UUID
+ (NSString*)UUID;
/// IDFA
+ (NSString*)IDFA;
/// shortVersion
+ (NSString*)shortVersion;
/// bundleIdentifier
+ (NSString*)bundleIdentifier;
/// displayName
+ (NSString*)displayName;
@end
