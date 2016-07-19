//
//  OLAFNTools.m
//  OLMVVM
//
//  Created by olive on 16/7/19.
//  Copyright © 2016年 olive. All rights reserved.
//

#import "OLAFNTools.h"
#import "AFNetworking.h"

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

- (void)httpgGetRequest:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(OLResponse *))success failure:(void (NSError *))failure {
    NSLog(@".... get request url:%@", url);
    NSLog(@".... 参数parameters:%@", parameter);
    
//    AFHTTPRequestOperationManager *manager = 
    
}

@end
