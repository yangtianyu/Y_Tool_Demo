#import <Foundation/Foundation.h>

//沙盒目录介绍
//Documents: 最常用的目录，存放重要的数据，iTunes同步时会备份该目录
//Library/Caches: 一般存放体积大，不重要的数据，iTunes同步时不会备份该目录
//Library/Preferences: 存放用户的偏好设置，iTunes同步时会备份该目录
//tmp: 用于存放临时文件，在程序未运行时可能会删除该文件夹中的数据，iTunes同步时不会备份该目录

@interface Y_Storage : NSObject

@end

