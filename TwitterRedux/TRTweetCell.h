//
//  TRTweetCell.h
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/1/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRTwitterTweet.h"

@class TRTweetCell;

@protocol TRTweetCellDelegate <NSObject>

- (void)onAuthorImageViewDidTapWithTweetCell:(TRTweetCell *)tweetCell;

@end

@interface TRTweetCell : UITableViewCell

@property (nonatomic, strong, readwrite) TRTwitterTweet *tweet;

@property (nonatomic, weak, readwrite) id<TRTweetCellDelegate> delegate;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
