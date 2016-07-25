//
//  OLRequest.m
//  OLMVVM
//
//  Created by olive on 16/7/15.
//  Copyright © 2016年 olive. All rights reserved.
//

#import "OLRequest.h"
#import "OLDefine.h"
#import "OLAFNTools.h"

//首页list
#define kApi_Get_HomePageList @"http://cloud.bmob.cn/f8bb56aa119e68ee/news_list_2_0"

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

- (void)requestGetHomePageList:(NSInteger)pageSize pageNum:(NSInteger)pageNum success:(void (^)(OLResponse *response))success failure:(void (^)(NSError *error))failure {
    NSDictionary *parmDic=[NSDictionary dictionaryWithObjectsAndKeys:@(pageSize),@"limit", @(pageNum),@"skip", nil];
    
    [[OLAFNTools shareAFNTools] httpgGetRequest:kApi_Get_HomePageList parameter:parmDic success:^(OLResponse *response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
