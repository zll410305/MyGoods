//
//  H_requestDateService.m
//  Lgoods
//
//  Created by Administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "H_requestDateService.h"
#import "AFNetworking.h"

#define API @"http://10.110.5.39/Izhe/searchclothes.php"

@implementation H_requestDateService

+ (void)requestDataWithDictionary:(NSDictionary *)dictionary andSuccess:(void (^)(NSDictionary *))success{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager POST:API parameters:dictionary progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic2 = responseObject;
        NSDictionary *result = [dic2 objectForKey:@"result"];
        success(result);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"11111");
    }];
    
    
//    [manager POST:API parameters:<#(nullable id)#> constructingBodyWithBlock:<#^(id<AFMultipartFormData>  _Nonnull formData)block#> progress:<#^(NSProgress * _Nonnull uploadProgress)uploadProgress#> success:<#^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)success#> failure:<#^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)failure#>]
    
}




//搜索方法
+(void)requst:(NSString *)str andwith:(void (^)(NSDictionary *))sucess{
    
    
    AFHTTPSessionManager *manger=[AFHTTPSessionManager manager];
    manger.responseSerializer=[AFJSONResponseSerializer serializer];
    NSString *str1;
    [manger POST:str1 parameters:str progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"heh");
    }];
    
    
    NSDictionary *dic=@{
                        
                        @"result" :@[@{
                                         
                                         @"shop" :@"海澜之家",
                                         @"shopnum":@"12345678",
                                         @"shopadress":@"12306",
                                         @"clothes" : @[
                                                 @{
                                                     @"clothes_name" :@"男上衣",
                                                     @"clothes_type" :@"上衣",
                                                     @"clothes_color" :@[@"红",@"黑",@"白"],
                                                     @"clothes_price" :@"200",
                                                     @"clothes_size" :@[@"L",@"XL",@"XXL",@"XXXL"],
                                                     @"clothes_describe" :@"穿起来就是可爱",
                                                     @"clothes_pictures" :@[@"1.png",@"2.png",@"3.png",@"4.png"],
                                                     @"clothes_new" :@"新",
                                                     @"clothes_discount" :@"活动",
                                                     },
                                                 @{
                                                     @"clothes_name" :@"男裤",
                                                     @"clothes_type" :@"裤子",
                                                     @"clothes_color" :@[@"红",@"黑",@"白"],
                                                     @"clothes_price" :@"200",
                                                     @"clothes_size" :@[@"L",@"XL",@"XXL",@"XXXL"],
                                                     @"clothes_describe" :@"穿起来就是可爱",
                                                     @"clothes_pictures" :@[@"1.png",@"2.png",@"3.png",@"4.png"],
                                                     @"clothes_new" :@"新",
                                                     @"clothes_discount" :@"活动",
                                                     },
                                                 @{
                                                     @"clothes_name" :@"女上衣",
                                                     @"clothes_type" :@"上衣",
                                                     @"clothes_color" :@[@"红",@"黑",@"白"],
                                                     @"clothes_price" :@"200",
                                                     @"clothes_size" :@[@"L",@"XL",@"XXL",@"XXXL"],
                                                     @"clothes_describe" :@"穿起来就是可爱",
                                                     @"clothes_pictures" :@[@"1.png",@"2.png",@"3.png",@"4.png"],
                                                     @"clothes_new" :@"新",
                                                     @"clothes_discount" :@"活动",
                                                     },
                                                 @{
                                                     @"clothes_name" :@"女裤",
                                                     @"clothes_type" :@"上衣",
                                                     @"clothes_color" :@[@"红",@"黑",@"白"],
                                                     @"clothes_price" :@"200",
                                                     @"clothes_size" :@[@"L",@"XL",@"XXL",@"XXXL"],
                                                     @"clothes_describe" :@"穿起来就是可爱",
                                                     @"clothes_pictures" :@[@"1.png",@"2.png",@"3.png",@"4.png"],
                                                     @"clothes_new" :@"新",
                                                     @"clothes_discount" :@"活动",
                                                     }
                                                 ]
                                         },
                                     @{
                                         
                                         @"shop" :@"美特斯邦威",
                                         @"shopnum":@"12345678",
                                         @"shopadress":@"12306",
                                         @"clothes" : @[
                                                 @{
                                                     @"clothes_name" :@"男上衣",
                                                     @"clothes_type" :@"上衣",
                                                     @"clothes_color" :@[@"红",@"黑",@"白"],
                                                     @"clothes_price" :@"200",
                                                     @"clothes_size" :@[@"L",@"XL",@"XXL",@"XXXL"],
                                                     @"clothes_describe" :@"穿起来就是可爱",
                                                     @"clothes_pictures" :@[@"1.png",@"2.png",@"3.png",@"4.png"],
                                                     @"clothes_new" :@"新",
                                                     @"clothes_discount" :@"活动",
                                                     },
                                                 @{
                                                     @"clothes_name" :@"男裤",
                                                     @"clothes_type" :@"裤子",
                                                     @"clothes_color" :@[@"红",@"黑",@"白"],
                                                     @"clothes_price" :@"200",
                                                     @"clothes_size" :@[@"L",@"XL",@"XXL",@"XXXL"],
                                                     @"clothes_describe" :@"穿起来就是可爱",
                                                     @"clothes_pictures" :@[@"1.png",@"2.png",@"3.png",@"4.png"],
                                                     @"clothes_new" :@"新",
                                                     @"clothes_discount" :@"活动",
                                                     },
                                                 @{
                                                     @"clothes_name" :@"女上衣",
                                                     @"clothes_type" :@"上衣",
                                                     @"clothes_color" :@[@"红",@"黑",@"白"],
                                                     @"clothes_price" :@"200",
                                                     @"clothes_size" :@[@"L",@"XL",@"XXL",@"XXXL"],
                                                     @"clothes_describe" :@"穿起来就是可爱",
                                                     @"clothes_pictures" :@[@"1.png",@"2.png",@"3.png",@"4.png"],
                                                     @"clothes_new" :@"新",
                                                     @"clothes_discount" :@"活动",
                                                     },
                                                 @{
                                                     @"clothes_name" :@"女裤",
                                                     @"clothes_type" :@"上衣",
                                                     @"clothes_color" :@[@"红",@"黑",@"白"],
                                                     @"clothes_price" :@"200",
                                                     @"clothes_size" :@[@"L",@"XL",@"XXL",@"XXXL"],
                                                     @"clothes_describe" :@"穿起来就是可爱",
                                                     @"clothes_pictures" :@[@"1.png",@"2.png",@"3.png",@"4.png"],
                                                     @"clothes_new" :@"新",
                                                     @"clothes_discount" :@"活动",
                                                     }
                                                 ]
                                         },
                                     ]
                        
                        };
    
    
    
    sucess(dic);
}




@end
