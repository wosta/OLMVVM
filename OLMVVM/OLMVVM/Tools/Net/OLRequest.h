//
//  OLRequest.h
//  OLMVVM
//  所有请求接口或者按功能模块划分
//  Created by olive on 16/7/15.
//  Copyright © 2016年 olive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OLResponse.h"

typedef NS_ENUM(NSUInteger, OLResquestType){
    OLRequestTypeGet = 0,
    OLRequestTypePost ,
};

@interface OLRequest : NSObject

+ (OLRequest *)sharedRequest;

- (void)requestType:(OLResquestType)requestType pageList:(NSInteger)pageSize pageNum:(NSInteger)pageNum success:(void(^)(OLResponse *response))success failure:(void(^)(NSError *error))failure;

@end
