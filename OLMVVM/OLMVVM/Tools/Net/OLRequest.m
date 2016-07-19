//
//  OLRequest.m
//  OLMVVM
//
//  Created by olive on 16/7/15.
//  Copyright © 2016年 olive. All rights reserved.
//

#import "OLRequest.h"
#import "OLDefine.h"

@implementation OLRequest

static OLRequest *shareRequest;
static dispatch_once_t once;
+ (OLRequest *)sharedRequest {
    dispatch_once(&once, ^{
        if (!shareRequest) {
            shareRequest = [[OLRequest alloc] init];
        }
    });
    return shareRequest;
}

- (void)requestGetHomePageSize:(NSUInteger)pageSize pageNum:(NSUInteger)pageNum success:(void (^)(OLResponse *))success failure:(void (^)(NSError *))failure {
    NSDictionary *parmDic = [NSDictionary dictionaryWithObjectsAndKeys:@(kPageSize), @"limit", @(pageNum), @"skip", nil];
    
}

@end
