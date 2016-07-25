//
//  OLAFNTools.m
//  OLMVVM
//
//  Created by olive on 16/7/19.
//  Copyright © 2016年 olive. All rights reserved.
//

#import "OLAFNTools.h"
#import "AFNetworking.h"
#import "OLResponse.h"

@implementation OLAFNTools

static OLAFNTools *afnTools;
static dispatch_once_t once;
+ (OLAFNTools *)shareAFNTools {
    dispatch_once(&once, ^{
        if (!afnTools) {
            afnTools = [[OLAFNTools alloc] init];
        }
    });
    return afnTools;
}

- (void)httpgGetRequest:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(OLResponse *))success failure:(void (^)(NSError *))failure {
    NSLog(@".... get request url:%@", url);
    NSLog(@".... 参数parameters:%@", parameter);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    NSMutableArray *requestArray = [NSMutableArray array];
    for (NSString *request in requestArray) {
        if ([url isEqualToString:request]) {
            return;
        }
    }
    [requestArray addObject:url];
    
    // 不加上这句话，会报“Request failed: unacceptable content-type: text/plain”错误，因为我们要获取text/plain类型数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manager POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
////        NSString *responseString=[task responseString];
////        NSData *data = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//
//        OLResponse *responseObj = [[OLResponse alloc] initWithDictionary:jsonDic];
//        success(responseObj);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        failure(error);
//    }];
    
    [manager GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        OLResponse *responseObj = [[OLResponse alloc] initWithDictionary:jsonDic];
        
        success(responseObj);
        [requestArray removeObject:url];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end
