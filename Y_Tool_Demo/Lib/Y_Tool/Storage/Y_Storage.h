#import <Foundation/Foundation.h>

@interface Y_Storage : NSObject

/// 获取沙盒路径下的文件
//[self getSandboxPathWithFileName:@"" table:@"" searchPathDirectory:NSDocumentDirectory]
+ (NSString *)getSandboxPathWithFileName:(NSString *)fileName table:(NSString *)table searchPathDirectory:(NSSearchPathDirectory)searchPathDirectory;

#pragma mark -
#pragma mark ============== plist ==============
/// 从plist获取数据
+ (NSDictionary *)getContentFromPlistName:(NSString *)name;

#pragma mark -
#pragma mark ============== UserDefaults ==============
/// 向UserDefaults中保存内容
+ (void)saveContentToUserDefaults:(id)content forKey:(NSString *)key;
/// 从UserDefaults中获取内容
+ (id)getContentFromUserDefaults:(NSString *)key;

#pragma mark -
#pragma mark ============== 归解档 ==============
/// 归档
+ (BOOL)archiveObject:(id)object prefix:(NSString *)prefix;
/// 解档
+ (id)unarchiveClass:(Class)class prefix:(NSString *)prefix;

#pragma mark -
#pragma mark ============== 沙盒 ==============
//Documents: 最常用的目录，存放重要的数据，iTunes同步时会备份该目录
//Library/Caches: 一般存放体积大，不重要的数据，iTunes同步时不会备份该目录
//Library/Preferences: 存放用户的偏好设置，iTunes同步时会备份该目录
//tmp: 用于存放临时文件，在程序未运行时可能会删除该文件夹中的数据，iTunes同步时不会备份该目录
/// 保存音乐到沙盒路径
+ (void)saveFileToSandbox:(NSString *)fileUrlStr withFileName:(NSString *)fileName;
/// 获取沙盒路径下的文件
+ (NSString *)getFileFromSandbox:(NSString *)fileName;
/// 判断是否已经存储了文件
+ (BOOL)alreadySaveFile:(NSString *)fileName;

#pragma mark -
#pragma mark ============== keyChain ==============
/// 向keyChain中保存内容
+ (BOOL)saveContentToKeyChain:(NSString *)content forKey:(NSString *)key service:(NSString *)service;
/// 从keyChain中获取内容
+ (NSString *)getContentFromKeyChain:(NSString *)key service:(NSString *)service;
/// 清除keyChain中的数据
+ (BOOL)removeContentFromKeyChain:(NSString *)key service:(NSString *)service;

@end

