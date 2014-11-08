//
//  TRTimelineViewController.m
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/8/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import "TRTimelineViewController.h"

#import "TRProfileViewController.h"
#import "TRTweetCell.h"
#import "TRTwitterClient.h"

@interface TRTimelineViewController () <TRTweetCellDelegate>

@property (nonatomic, assign, readonly) SEL timelineGetSelector;
@property (nonatomic, strong, readwrite) NSArray *tweets;

@end

@implementation TRTimelineViewController

- (instancetype)initWithTitle:(NSString *)title timelineGetSelector:(SEL)timelineGetSelector {
  if (self = [super init]) {
    self.title = title;

    _timelineGetSelector = timelineGetSelector;

    [self reloadTweets];
  }
  return self;
}

- (void)reloadTweets {
  [[TRTwitterClient sharedInstance] performSelector:self.timelineGetSelector withObject:^(NSArray *tweets) {
    self.tweets = tweets;
    [self.tableView reloadData];
  } withObject:^(NSError *error) {
    NSLog(@"Fail to load timeline: %@", error);
  }];
}

- (void)loadView {
  [super loadView];
  self.view.backgroundColor = [UIColor colorWithRed:192.0/255 green:1 blue:1 alpha:1];
}

#pragma mark - NSTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TRTweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRTweetCell"];
  if (!cell) {
    cell = [[TRTweetCell alloc] initWithReuseIdentifier:@"TRTweetCell"];
    cell.backgroundColor = [UIColor clearColor];
  }
  cell.tweet = self.tweets[indexPath.row];
  cell.delegate = self;
  return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 60.5;
}

#pragma mark - TRTweetCellDelegate

- (void)onAuthorImageViewDidTapWithTweetCell:(TRTweetCell *)tweetCell {
  TRProfileViewController *profileViewController = [[TRProfileViewController alloc] init];
  profileViewController.user = tweetCell.tweet.author;
  [self.navigationController pushViewController:profileViewController animated:YES];
}

@end
