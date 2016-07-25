//
//  OLHomeViewModel.h
//  OLMVVM
//
//  Created by olive on 16/7/14.
//  Copyright © 2016年 olive. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HomeSuccessBlock)(NSArray *array);
typedef void(^HomeFailureBlock)(NSError *error);

@interface OLHomeViewModel : NSObject

@property (nonatomic, copy) HomeSuccessBlock homeSuccessBlock;
@property (nonatomic, copy) HomeFailureBlock homeFailureBlock;

- (void)handleData:(HomeSuccessBlock)success failure:(HomeFailureBlock)failure;

@end
