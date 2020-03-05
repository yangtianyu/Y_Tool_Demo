#import "Y_AppConfig.h"
#import "Y_Storage.h"
#import <AdSupport/AdSupport.h>

@implementation Y_AppConfig

///从Keychainz拿UUID，拿不到就生成并存起来
+ (NSString*)getUUIDFromKeychainWithBundleID:(NSString *)bundleID{
    if(bundleID == nil){
        bundleID = [self bundleIdentifier];
    }
    NSString * UUID = [Y_Storage getContentFromKeyChain:@"UUID" service:bundleID];
    if(!UUID){
        UUID = [self UUID];
        [Y_Storage saveContentToKeyChain:UUID forKey:@"UUID" service:bundleID];
    }
    return UUID;
}

/// UUID
+ (NSString*)UUID{
    [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return [[NSUUID UUID] UUIDString];
}

/// IDFA
+ (NSString*)IDFA{
    if([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]){
        return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    }
    return nil;
}

/// shortVersion
+ (NSString*)shortVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

/// bundleIdentifier
+ (NSString*)bundleIdentifier{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

/// displayName
+ (NSString*)displayName{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

@end
