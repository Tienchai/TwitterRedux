//
//  TRTwitterUser.h
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/1/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Mantle.h"

@interface TRTwitterUser : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong, readonly) NSString *ID;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *screenname;
@property (nonatomic, strong, readonly) NSURL *profileImageUrl;
@property (nonatomic, strong, readonly) NSString *tagline;
@property (nonatomic, assign, readonly) NSUInteger tweetsCount;
@property (nonatomic, assign, readonly) NSUInteger followingsCount;
@property (nonatomic, assign, readonly) NSUInteger followersCount;

+ (TRTwitterUser *)currentUser;
+ (void)setCurrentUser:(TRTwitterUser *)currentUser;

@end
