//
//  Myrequst.m
//  Lgoods
//
//  Created by administrator on 16/3/31.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "Myrequst.h"

@implementation Myrequst


+(void)requst:(NSString *)str and:(int)i andWith:(void (^)(NSMutableArray *))suceess{
//
//    
//    
//    XXXPlistLocalInfo *loca=[[XXXPlistLocalInfo alloc]init];
//    NSString *locpath=[loca userInfoPath];
//    NSString *last=[locpath stringByAppendingPathComponent:@"mt.plist"];
//    NSMutableArray *mutarr=[[NSMutableArray alloc]initWithContentsOfFile:last];
//    if (!(str.length==0)) {
//        if (mutarr==nil) {
//            
//            NSMutableArray *arr=[[NSMutableArray alloc]init];
//            [arr insertObject:str atIndex:0];
//            [mutarr addObjectsFromArray:arr];
//            BOOL isWrite=[mutarr writeToFile:last atomically:YES];
//            if (isWrite) {
//                NSLog(@"写入成功");
//            }else{
//                
//                NSLog(@"失败");
//                
//                
//            }
//            
//        }else{
//            BOOL a= [mutarr containsObject:str];
//            if (a) {
//                [mutarr removeObject:str];
//            }
//            [mutarr insertObject:str atIndex:0];
//            
//            BOOL isWrite=[mutarr writeToFile:last atomically:YES];
//            if (isWrite) {
//                NSLog(@"写入成功");
//            }else{
//                
//                NSLog(@"失败");
//                
//                
//            }
//            
//        }
//       
//        
//    }
//
//    
//    suceess(mutarr);
//
//     NSLog(@"%@",mutarr);
//
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *dbPath = [path stringByAppendingPathComponent:@"fmdbdemo1.db"];
       FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
      NSMutableArray* mutarr=[NSMutableArray arrayWithCapacity:0];
    if (![db open]) {
        NSLog(@"打开数据库失败");
    }
   
    BOOL isCreate  =  [db executeUpdate:@"CREATE TABLE fmdbList (search text)"];
    if (isCreate) {
        NSLog(@"创建表成功");
    }
    if (i==1) {
        if (!(str.length==0)) {
            NSString *name=str;
            [db executeUpdate:@"DELETE FROM fmdbList  WHERE search=?",name];
            
            BOOL isInsert=[db executeUpdate:@"INSERT INTO fmdbList(search)   VALUES(?)",name];
            if (isInsert) {
                NSLog(@"插入成功");
            }
            
            
        }

    }else {
        
        BOOL isDele= [db executeUpdate:@"DELETE FROM fmdbList"];
        if (isDele) {
            NSLog(@"删除成功");
        }
        [mutarr removeAllObjects];
        
    }
        FMResultSet *rs=[db executeQuery:@"SELECT search FROM fmdbList"];
    

        while ([rs next]) {
        NSString *str2=[rs stringForColumn:@"search"];
      

        [mutarr addObject:str2];
       
    }
     NSLog(@"%@",mutarr);
    [rs close];
    [db close];
    
    
    
    suceess(mutarr);
    
    
    
    
    
    
}


//写入NSUserDefaults
+(void)Write:(NSString *)namestr andWith:(NSString *)numstr andWith:(NSString *)i{
    
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    [user setObject:namestr forKey:@"昵称"];
    [user setObject:numstr forKey:@"密码"];
    [user setObject:i forKey:@"手机号"];
//   NSString *name=[user objectForKey:@"昵称"];
//    NSString *num=[user objectForKey:@"密码"];
//    NSString *pho=[user objectForKey:@"手机号"];
//    NSLog(@"%@",name);
//    NSLog(@"%@",num);
//    NSLog(@"%@",pho);
    
    
    
    
    
    
    
    
    
}

//读取NSUserDefaults值

+(void)Read:(void (^)(NSArray *))sucess{
    
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    NSString *name=[user objectForKey:@"昵称"];
    NSArray *arr=[NSArray arrayWithObjects:name, nil];
//    NSLog(@"%@",name);
    sucess(arr);
    
    
    
    
    
    
    
}


+(void)Delete{
    
     NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    [user removeObjectForKey:@"昵称"];
    [user removeObjectForKey:@"密码"];
    [user removeObjectForKey:@"手机号"];
    [user removeObjectForKey:@"图片"];

    
    
    
    
    
    
    
}


+(void)Let:(NSData *)data{
    
    
    
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    [user setObject:data forKey:@"图片"];
    NSData *tt=[user objectForKey:@"图片"];
    NSLog(@"%@",tt);
    
    
    
    
}

+(void)Lot:(void (^)(NSData *))sucess{
    
    
    
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    NSData *imgdata=[user objectForKey:@"图片"];
    sucess(imgdata);
    
    
}

@end
