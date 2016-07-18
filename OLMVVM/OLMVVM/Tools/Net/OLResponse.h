//
//  OLResponse.h
//  OLMVVM
//  所有接口响应
//  Created by olive on 16/7/15.
//  Copyright © 2016年 olive. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, OLServerState) {
    OLServerStateFailure = 0,
    OLServerStateSuccess,
};

@interface OLResponse : NSObject
/** 返回状态 */
@property (nonatomic, assign) OLServerState serverState;
/** 返回的数据 */
@property (nonatomic, strong) NSObject *data;
/** 返回的消息 */
@property (nonatomic, copy) NSString *message;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (OLResponse *)initWithServerState:(OLServerState)serverState result:(NSObject *)data message:(NSString *)message;

@end
