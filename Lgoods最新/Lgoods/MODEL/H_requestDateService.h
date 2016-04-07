//
//  H_requestDateService.h
//  Lgoods
//
//  Created by Administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface H_requestDateService : NSObject

+ (void)requestDataWithDictionary:(NSDictionary *)dictionary andSuccess:(void (^)(NSDictionary *resultDic))success;





//搜索请求
+(void)requst:(NSString *)str andwith:(void(^)(NSDictionary *dic))sucess;

@end
