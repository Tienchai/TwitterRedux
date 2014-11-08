//
//  TRProfileSingleInfoView.m
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/9/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import "TRProfileSingleInfoView.h"

@interface TRProfileSingleInfoView ()

@property (nonatomic, strong, readonly) UILabel *countLabel;
@property (nonatomic, strong, readonly) UILabel *titleLabel;

@end

@implementation TRProfileSingleInfoView

- (instancetype)init {
  if (self = [super init]) {
    _countLabel = [[UILabel alloc] init];
    _countLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_countLabel];

    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor grayColor];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_titleLabel];

    self.layer.borderColor = [UIColor colorWithRed:81.0/255 green:1 blue:1 alpha:1].CGColor;
    self.layer.borderWidth = 1;
    [self setNeedsUpdateConstraints];
  }
  return self;
}

- (void)updateConstraints {
  NSDictionary *views = @{@"countLabel": self.countLabel, @"titleLabel": self.titleLabel};

  [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[countLabel]-(>=5)-|"
                                                               options:0
                                                               metrics:nil
                                                                 views:views]];

  [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[countLabel]-5-[titleLabel]-5-|"
                                                               options:NSLayoutFormatAlignAllLeading
                                                               metrics:nil
                                                                 views:views]];

  [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[titleLabel]-(>=5)-|"
                                                               options:0
                                                               metrics:nil
                                                                 views:views]];

  [super updateConstraints];
}

#pragma mark - properties

@synthesize count = _count;
@synthesize title = _title;

- (void)setCount:(NSUInteger)count {
  if (_count != count || self.countLabel.text.length <= 0) {
    _count = count;
    self.countLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)_count];
  }
}

- (void)setTitle:(NSString *)title {
  if (![_title isEqual:title]) {
    _title = title;
    self.titleLabel.text = _title;
  }
}

@end
