//
//  Myrequst.h
//  Lgoods
//
//  Created by administrator on 16/3/31.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "XXXPlistLocalInfo.h"
#import "FMDB.h"
@interface Myrequst : NSObject


//fmdb框架存储历史记录
+(void)requst:(NSString *)str and:(int)i  andWith:(void(^)(NSMutableArray *arr))suceess;


//NSString *localPaths = NSHomeDirectory();

//localPaths = [localPaths stringByAppendingPathComponent:@"Documents"];


//写入NSUserDefaults

+(void)Write:(NSString *)namestr andWith:(NSString *)numstr andWith:(NSString *)i;




//读取NSUserDefaults值

+(void)Read:(void(^)(NSArray *arr))sucess;


//删除NSUserDefaults值
+(void)Delete;



//储存图片NSUserDefaults

+(void)Let:(NSData *)data;


//取照片

+(void)Lot:(void(^)(NSData*data))sucess;




@end