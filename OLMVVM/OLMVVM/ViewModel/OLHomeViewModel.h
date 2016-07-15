//
//  OLHomeViewModel.h
//  OLMVVM
//
//  Created by olive on 16/7/14.
//  Copyright © 2016年 olive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OLHomeViewModel : NSObject

- (void)repostSuccess:(void (^)(NSArray *dataArray))success faile:(void (^)(NSError *error))faile;

@end
