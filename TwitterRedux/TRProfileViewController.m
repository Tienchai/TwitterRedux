//
//  TRProfileViewController.m
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/8/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import "TRProfileViewController.h"

#import "TRProfileHeaderView.h"
#import "TRProfileSingleInfoView.h"

@interface TRProfileViewController ()

@property (nonatomic, strong, readonly) TRProfileHeaderView *headerView;

@property (nonatomic, strong, readonly) TRProfileSingleInfoView *tweetsCountView;
@property (nonatomic, strong, readonly) TRProfileSingleInfoView *followingsCountView;
@property (nonatomic, strong, readonly) TRProfileSingleInfoView *followersCountView;

@property (nonatomic, strong, readwrite) NSLayoutConstraint *topLayoutConstraint;

@end

@implementation TRProfileViewController

- (instancetype)init {
  if (self = [super init]) {
    _headerView = [[TRProfileHeaderView alloc] init];
    _headerView.translatesAutoresizingMaskIntoConstraints = NO;

    _tweetsCountView = [[TRProfileSingleInfoView alloc] init];
    _tweetsCountView.title = @"Tweets";
    _tweetsCountView.translatesAutoresizingMaskIntoConstraints = NO;

    _followingsCountView = [[TRProfileSingleInfoView alloc] init];
    _followingsCountView.title = @"Following";
    _followingsCountView.translatesAutoresizingMaskIntoConstraints = NO;

    _followersCountView = [[TRProfileSingleInfoView alloc] init];
    _followersCountView.title = @"Followers";
    _followersCountView.translatesAutoresizingMaskIntoConstraints = NO;
  }
  return self;
}

- (void)loadView {
  [super loadView];

  [self.view addSubview:self.headerView];
  [self.view addSubview:self.tweetsCountView];
  [self.view addSubview:self.followingsCountView];
  [self.view addSubview:self.followersCountView];

  self.view.backgroundColor = [UIColor colorWithRed:192.0/255 green:1 blue:1 alpha:1];
  [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints {
  [self.view removeConstraint:self.topLayoutConstraint];
  self.topLayoutConstraint = [NSLayoutConstraint constraintWithItem:self.headerView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:50 + CGRectGetHeight(self.navigationController.navigationBar.bounds)];

  [self.view addConstraint:self.topLayoutConstraint];

  NSDictionary *views = @{@"headerView": self.headerView,
                          @"tweetsCountView": self.tweetsCountView,
                          @"followingsCountView": self.followingsCountView,
                          @"followersCountView": self.followersCountView,
                          };

  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[headerView]-5-[followingsCountView]-(>=10)-|"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:views]];

  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tweetsCountView]-0-[followingsCountView]-0-[followersCountView]-0-|"
                                                                    options:NSLayoutFormatAlignAllCenterY
                                                                    metrics:nil
                                                                      views:views]];

  [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.headerView
                                                        attribute:NSLayoutAttributeCenterX
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.view
                                                        attribute:NSLayoutAttributeCenterX
                                                       multiplier:1
                                                         constant:0]];

  [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.tweetsCountView
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.followingsCountView
                                                        attribute:NSLayoutAttributeWidth
                                                       multiplier:1
                                                         constant:0]];

  [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.followersCountView
                                                        attribute:NSLayoutAttributeWidth
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.followingsCountView
                                                        attribute:NSLayoutAttributeWidth
                                                       multiplier:1
                                                         constant:0]];

  [super updateViewConstraints];
}

#pragma mark - user

@synthesize user = _user;

- (void)setUser:(TRTwitterUser *)user {
  if (![_user isEqual:user]) {
    _user = user;
    self.title = _user.name;
    self.headerView.user = _user;
    self.tweetsCountView.count = _user.tweetsCount;
    self.followingsCountView.count = _user.followingsCount;
    self.followersCountView.count = _user.followersCount;
  }
}

@end
