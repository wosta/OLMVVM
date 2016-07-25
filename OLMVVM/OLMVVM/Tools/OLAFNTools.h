//
//  OLAFNTools.h
//  OLMVVM
//
//  Created by olive on 16/7/19.
//  Copyright © 2016年 olive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OLRequest.h"
@class OLResponse;

@interface OLAFNTools : NSObject
+ (OLAFNTools *)shareAFNTools;

- (void)httpRequestType:(OLResquestType)requestType url:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(OLResponse *response))success failure:(void (^)(NSError *error))failure;


@end
