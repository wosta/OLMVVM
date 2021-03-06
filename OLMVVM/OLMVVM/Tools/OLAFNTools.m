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
#import "OLRequest.h"

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

- (void)httpRequestType:(OLResquestType)requestType url:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(OLResponse *response))success failure:(void (^)(NSError *error))failure {
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
    if (requestType == OLRequestTypeGet) {
        [self getManager:manager url:url parameter:parameter success:^(OLResponse *response) {
            success(response);
            [requestArray removeObject:url];
        } failure:^(NSError *error) {
            failure(error);
        }];
    }else if (requestType == OLRequestTypePost) {
        [self postManager:manager url:url parameter:parameter success:^(OLResponse *response) {
            success(response);
        } failure:^(NSError *error) {
            failure(error);
        }];
    }
}

- (void)getManager:(AFHTTPSessionManager *)manager url:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(OLResponse *response))success failure:(void (^)(NSError *error))failure {
    [manager GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        OLResponse *responseObj = [[OLResponse alloc] initWithDictionary:jsonDic];
        success(responseObj);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

- (void)postManager:(AFHTTPSessionManager *)manager url:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(OLResponse *response))success failure:(void (^)(NSError *error))failure{
    
    [manager POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

    } progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        OLResponse *responseObj = [[OLResponse alloc] initWithDictionary:jsonDic];
        success(responseObj);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

@end
