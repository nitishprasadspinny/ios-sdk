//
//  TCUpdateProfileRequest.m
//  TrueSDK
//
//  Created by Sreedeepkesav M S on 16/11/20.
//  Copyright © 2020 True Software Scandinavia AB. All rights reserved.
//

#import "TCUpdateProfileRequest.h"
#import "NSURL+TrueSDK.h"

@interface TCUpdateProfileRequest()

@property (nonatomic, strong) NSString *auth;

@end

@implementation TCUpdateProfileRequest

- (instancetype)initWithappKey: (NSString *)appKey
                       appLink: (NSString *)appLink
                   countryCode: (NSString *)countryCode
                          auth: (NSString *)auth {
    NSURL *url = [NSURL baseUrlForCountryCode:countryCode];
    self = [super initWithappKey:appKey
                         appLink:appLink
                      httpMethod:@"POST"
                       urlString:url.absoluteString];
    self.auth = auth;
    return self;
}

- (void)updateFirstName: (NSString *)firstName
               lastName: (NSString *)lastname {
    NSDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setValue:firstName forKey:@"firstName"];
    [parameters setValue:lastname forKey:@"lastName"];
        
    [self makeAuthorisedRequestWithParemeters:parameters
                                         auth:self.auth
                                   completion:^(NSDictionary * _Nullable response,
                                                NSError * _Nullable error) {
        //Do nothing as of now
    }];
}

@end
