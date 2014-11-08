//
//  TRProfileHeaderView.m
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/9/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import "TRProfileHeaderView.h"

#import "UIImageView+AFNetworking.h"

@interface TRProfileHeaderView ()

@property (nonatomic, strong, readonly) UIImageView *profilePictureImageView;
@property (nonatomic, strong, readonly) UILabel *nameLabel;
@property (nonatomic, strong, readonly) UILabel *screennameLabel;

@end

@implementation TRProfileHeaderView

- (instancetype)init {
  if (self = [super init]) {
    _profilePictureImageView = [[UIImageView alloc] init];
    _profilePictureImageView.contentMode = UIViewContentModeScaleAspectFit;
    _profilePictureImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_profilePictureImageView];

    _nameLabel = [[UILabel alloc] init];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_nameLabel];

    _screennameLabel = [[UILabel alloc] init];
    _screennameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_screennameLabel];

    [self setNeedsUpdateConstraints];
  }
  return self;
}

- (void)updateConstraints {

  NSDictionary *views = @{@"profilePictureImageView": self.profilePictureImageView,
                          @"nameLabel": self.nameLabel,
                          @"screennameLabel": self.screennameLabel,
                          };

  [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[profilePictureImageView(100)]-5-[nameLabel]-5-[screennameLabel]-5-|"
                                                               options:NSLayoutFormatAlignAllCenterX
                                                               metrics:nil
                                                                 views:views]];

  [self addConstraint:[NSLayoutConstraint constraintWithItem:self.profilePictureImageView
                                                   attribute:NSLayoutAttributeWidth
                                                   relatedBy:NSLayoutRelationEqual
                                                      toItem:self.profilePictureImageView
                                                   attribute:NSLayoutAttributeHeight
                                                  multiplier:1
                                                    constant:0]];

  [self addConstraint:[NSLayoutConstraint constraintWithItem:self.profilePictureImageView
                                                   attribute:NSLayoutAttributeCenterX
                                                   relatedBy:NSLayoutRelationEqual
                                                      toItem:self
                                                   attribute:NSLayoutAttributeCenterX
                                                  multiplier:1
                                                    constant:0]];

  [super updateConstraints];

}

#pragma mark - user

@synthesize user = _user;

- (void)setUser:(TRTwitterUser *)user {
  if (![_user isEqual:user]) {
    _user = user;
    [self.profilePictureImageView setImageWithURL:_user.profileImageUrl];
    self.nameLabel.text = _user.name;
    self.screennameLabel.text = [NSString stringWithFormat:@"@%@", _user.screenname];
  }
}

@end
