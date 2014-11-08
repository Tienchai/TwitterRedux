//
//  TRProfileHeaderCell.m
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/9/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import "TRProfileHeaderCell.h"

#import "TRProfileHeaderView.h"

@interface TRProfileHeaderCell ()

@property (nonatomic, strong, readonly) TRProfileHeaderView *headerView;

@end

@implementation TRProfileHeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    _headerView = [[TRProfileHeaderView alloc] init];
    _headerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_headerView];

    [self setNeedsUpdateConstraints];
  }
  return self;
}

- (void)updateConstraints {
  NSDictionary *views = @{@"headerView": self.headerView};

  [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[headerView]-0-|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:views]];

  [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[headerView]-0-|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:views]];

  [super updateConstraints];
}

#pragma mark - user

@synthesize user = _user;

- (void)setUser:(TRTwitterUser *)user {
  if (![_user isEqual:user]) {
    _user = user;
    self.headerView.user = _user;
  }
}

@end
