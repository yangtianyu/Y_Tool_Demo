#import "Y_Storage.h"
#import "SAMKeychain.h"

@implementation Y_Storage

//[self getSandboxPathWithFileName:@"" table:@"" searchPathDirectory:NSDocumentDirectory]
+ (NSString *)getSandboxPathWithFileName:(NSString *)fileName table:(NSString *)table searchPathDirectory:(NSSearchPathDirectory)searchPathDirectory {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(searchPathDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePathFolder = [documentPath stringsByAppendingPaths:@[table]].firstObject;
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePathFolder]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePathFolder withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *path = [NSString stringWithFormat:@"%@/%@",filePathFolder,fileName];
    return path;
}

#pragma mark -
#pragma mark ============== plist ==============
+ (NSDictionary *)getContentFromPlistName:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    return dict;
}

#pragma mark -
#pragma mark ============== UserDefaults ==============
+ (void)saveContentToUserDefaults:(id)content forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:content forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)getContentFromUserDefaults:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

#pragma mark -
#pragma mark ============== 归解档 ==============
+ (BOOL)archiveObject:(id)object prefix:(NSString *)prefix {
    if (!object){
        return NO;
    }
    NSError *error;
    //会调用对象的initWithCoder方法
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object requiringSecureCoding:YES error:&error];
    if (error){
        return NO;
    }
    [data writeToFile:[self getSandboxPathWithFileName:prefix table:@"y_archive" searchPathDirectory:NSDocumentDirectory] atomically:YES];
    return YES;
}

+ (id)unarchiveClass:(Class)class prefix:(NSString *)prefix {
    NSError *error;
    NSData *data = [[NSData alloc] initWithContentsOfFile:[self getSandboxPathWithFileName:prefix table:@"y_archive" searchPathDirectory:NSDocumentDirectory]];
    id content = [NSKeyedUnarchiver unarchivedObjectOfClass:class fromData:data error:&error];
    if (error) {
        return nil;
    }
    return content;
}

#pragma mark -
#pragma mark ============== 沙盒 ==============
+ (void)saveFileToSandbox:(NSString *)fileUrlStr withFileName:(NSString *)fileName {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if ([self alreadySaveFile:fileName]){
            return;
        }
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileUrlStr]];
        [data writeToFile:[self getSandboxPathWithFileName:fileName table:@"y_file" searchPathDirectory:NSDocumentDirectory] atomically:YES];
    });
}

+ (NSString *)getFileFromSandbox:(NSString *)fileName {
    NSString *filePath = [self getSandboxPathWithFileName:fileName table:@"y_file" searchPathDirectory:NSDocumentDirectory];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return filePath;
    }
    return nil;
}

+ (BOOL)alreadySaveFile:(NSString *)fileName {
    NSString *filePath = [self getSandboxPathWithFileName:fileName table:@"y_file" searchPathDirectory:NSDocumentDirectory];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return NO;
    } else {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        if (data.length > 0) {
            return YES;
        }
        return NO;
    }
}

#pragma mark -
#pragma mark ============== keyChain ==============
+ (BOOL)saveContentToKeyChain:(NSString *)content forKey:(NSString *)key service:(NSString *)service {
    return [SAMKeychain setPassword:content forService:service account:key];
}

+ (NSString *)getContentFromKeyChain:(NSString *)key service:(NSString *)service {
    return [SAMKeychain passwordForService:service account:key];
}

+ (BOOL)removeContentFromKeyChain:(NSString *)key service:(NSString *)service {
    return [SAMKeychain deletePasswordForService:service account:key];
}
@end

