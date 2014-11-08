//
//  TRTwitterTweet.h
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/1/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRTwitterUser.h"

@interface TRTwitterTweet : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong, readonly) NSString *ID;
@property (nonatomic, strong, readonly) NSString *text;
@property (nonatomic, strong, readonly) NSDate *createdTime;
@property (nonatomic, strong, readonly) TRTwitterUser *author;
@property (nonatomic, assign, readonly) NSUInteger retweetCount;
@property (nonatomic, assign, readonly) NSUInteger favouritesCount;
@property (nonatomic, assign, readonly) BOOL retweeted;
@property (nonatomic, assign, readonly) BOOL favourited;

@end
