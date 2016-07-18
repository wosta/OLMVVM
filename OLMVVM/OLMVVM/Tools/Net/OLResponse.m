//
//  OLResponse.m
//  OLMVVM
//
//  Created by olive on 16/7/15.
//  Copyright © 2016年 olive. All rights reserved.
//

#import "OLResponse.h"

@implementation OLResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    OLServerState serverState = OLServerStateSuccess;
    NSObject *data = @"";
    NSString *message = @"";
    NSString *state = @"";
    if ([dictionary valueForKey:@"code"]) {
        serverState = [[dictionary valueForKey:@"code"] integerValue];
    }
    data = [dictionary objectForKey:@"data"];
    message = [dictionary objectForKey:@"message"];
    state = [dictionary objectForKey:@"state"];
    return [self initWithServerState:serverState result:data message:message];
}

- (OLResponse *)initWithServerState:(OLServerState)serverState result:(NSObject *)data message:(NSString *)message {
    self = [super init];
    if (self) {
        _serverState = serverState;
        _data = data;
        _message = message;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"state=%@, data=%@, messgage=%@", (_serverState), _data, _message];
}

@end
