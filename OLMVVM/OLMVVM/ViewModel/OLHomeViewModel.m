//
//  OLHomeViewModel.m
//  OLMVVM
//
//  Created by olive on 16/7/14.
//  Copyright © 2016年 olive. All rights reserved.
//

#import "OLHomeViewModel.h"
#import "OLRequest.h"
#import "OLHomeModel.h"

@implementation OLHomeViewModel

- (void)handleData:(HomeSuccessBlock)success failure:(HomeFailureBlock)failure {
    [[OLRequest sharedRequest] requestGetHomePageList:20 pageNum:0 success:^(OLResponse *response) {
        NSLog(@"......response.description:%@", response.description);
        
        if (response.serverStatus == OLServerStatusSuccess) {
            NSLog(@"success");
            NSMutableArray *temArr = [NSMutableArray array];
            for (NSDictionary *dic in (NSArray *)[response.data valueForKey:@"results"] ) {
                OLHomeModel *homeModel = [[OLHomeModel alloc] initWithDictionary:dic error:nil];
                [temArr addObject:homeModel];
            }
            success(temArr);
        }
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
