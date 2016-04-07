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



+(void)requst:(NSString *)str and:(int)i  andWith:(void(^)(NSMutableArray *arr))suceess;
@end
