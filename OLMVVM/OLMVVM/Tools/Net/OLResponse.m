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
    OLServerStatus serverStatus = OLServerStatusSuccess;
    NSObject *data = @"";
    NSString *message = @"";
    NSString *state = @"";
    if ([dictionary valueForKey:@"code"]) {
        serverStatus = [[dictionary valueForKey:@"code"] integerValue];
    }
    data = [dictionary objectForKey:@"data"];
    message = [dictionary objectForKey:@"message"];
    state = [dictionary objectForKey:@"state"];
    return [self initWithServerState:serverStatus result:data message:message];
}

- (OLResponse *)initWithServerState:(OLServerStatus)serverStatus result:(NSObject *)data message:(NSString *)message {
    self = [super init];
    if (self) {
        _serverStatus = serverStatus;
        _data = data;
        _message = message;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"status=%@, data=%@, messgage=%@", @(_serverStatus), _data, _message];
}

@end
