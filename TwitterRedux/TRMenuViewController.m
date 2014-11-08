//
//  TRMenuViewController.m
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/8/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import "TRMenuViewController.h"

#import "TRProfileHeaderCell.h"
#import "TRTwitterUser.h"
#import "UIImageView+AFNetworking.h"

@interface TRMenuViewController ()

@end

@implementation TRMenuViewController

- (void)loadView {
  [super loadView];
  self.tableView.backgroundColor = [UIColor colorWithRed:240.0/255 green:1 blue:1 alpha:1];
  self.tableView.separatorColor = [UIColor clearColor];
  self.tableView.bounces = NO;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.class cellConfigurations].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = nil;
  if (indexPath.row == TRMenuViewProfileItemIndex) {
    TRProfileHeaderCell *profileCell = [[TRProfileHeaderCell alloc] init];
    profileCell.user = [TRTwitterUser currentUser];
    cell = profileCell;
  } else {
    NSArray *cellConfiguration = [self.class cellConfigurations][indexPath.row];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text = cellConfiguration[1];
  }
  cell.backgroundColor = [UIColor clearColor];
  cell.selectionStyle = UITableViewCellSelectionStyleBlue;
  return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  NSArray *cellConfiguration = [self.class cellConfigurations][indexPath.row];
  [self.delegate menuViewController:self onItemIndexDidTap:[cellConfiguration[0] unsignedIntegerValue]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row == TRMenuViewProfileItemIndex) {
    return 180;
  } else {
    return 30;
  }
}

#pragma mark - cell configurations

+ (NSArray *)cellConfigurations {
  static NSArray *cellConfigurations;
  static dispatch_once_t once;
  dispatch_once(&once, ^{
    cellConfigurations = @[@[@(TRMenuViewProfileItemIndex), @"Profile"], @[@(TRMenuViewHomeItemIndex), @"Home"], @[@(TRMenuViewMentionItemIndex), @"Mention"], @[@(TRMenuViewLogoutItemIndex), @"Logout"]];
  });
  return cellConfigurations;
}

@end
