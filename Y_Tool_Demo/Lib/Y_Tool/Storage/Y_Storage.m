#import "Y_Storage.h"
#import "SAMKeychain.h"

@implementation Y_Storage
//plist文件主要用于不经常修改、数据量小的数据
//偏好设置主要用于检查版本是否更新、是否启动引导页、自动登录、版本号等程序设置归
//档解归档主要是归档之后的文件时加密的，用于一些数据量小的数据，数据库操作比较笨拙
//沙盒路径可以提高程序的体验度，为用户节约数据流量，主要在用户阅读书籍、听音乐、看视频等
//Core Data提供了对象关系的映射功能，使得能够将OC对象转换成数据，将数据库中的数据还原成OC对象，在转换的过程中不需要编写任何的SQL语句
//SQLite3是轻量级的数据库，占用资源很少，需要大量的SQL语句
//FMDB是对SQLite3的进一步封装，减去了C语言风格，更加的面向对象，同样需要大量的SQL语句
//Realm本质上也是一个嵌入式数据库，更加的轻量级，支持跨平台，没有Core Data与SQLite冗余、复杂的知识和代码，更加的面向对象，学习成本更小

/// 获取沙盒路径下的文件
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
/// 从plist获取数据
+ (NSDictionary *)getContentFromPlistName:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    return dict;
}

#pragma mark -
#pragma mark ============== UserDefaults ==============
/// 向UserDefaults中保存内容
+ (void)saveContentToUserDefaults:(id)content forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:content forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/// 从UserDefaults中获取内容
+ (id)getContentFromUserDefaults:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

#pragma mark -
#pragma mark ============== 归解档 ==============
/// 归档
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

/// 解档
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
//Documents: 最常用的目录，存放重要的数据，iTunes同步时会备份该目录
//Library/Caches: 一般存放体积大，不重要的数据，iTunes同步时不会备份该目录
//Library/Preferences: 存放用户的偏好设置，iTunes同步时会备份该目录
//tmp: 用于存放临时文件，在程序未运行时可能会删除该文件夹中的数据，iTunes同步时不会备份该目录
/// 保存音乐到沙盒路径
+ (void)saveFileToSandbox:(NSString *)fileUrlStr withFileName:(NSString *)fileName {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if ([self alreadySaveFile:fileName]){
            return;
        }
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileUrlStr]];
        [data writeToFile:[self getSandboxPathWithFileName:fileName table:@"y_file" searchPathDirectory:NSDocumentDirectory] atomically:YES];
    });
}

/// 获取沙盒路径下的文件
+ (NSString *)getFileFromSandbox:(NSString *)fileName {
    NSString *filePath = [self getSandboxPathWithFileName:fileName table:@"y_file" searchPathDirectory:NSDocumentDirectory];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return filePath;
    }
    return nil;
}

/// 判断是否已经存储了文件
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
/// 向keyChain中保存内容
+ (BOOL)saveContentToKeyChain:(NSString *)content forKey:(NSString *)key service:(NSString *)service {
    return [SAMKeychain setPassword:content forService:service account:key];
}
/// 从keyChain中获取内容
+ (NSString *)getContentFromKeyChain:(NSString *)key service:(NSString *)service {
    return [SAMKeychain passwordForService:service account:key];
}
/// 清除keyChain中的数据
+ (BOOL)removeContentFromKeyChain:(NSString *)key service:(NSString *)service {
    return [SAMKeychain deletePasswordForService:service account:key];
}
@end

