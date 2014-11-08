//
//  TRViewWithMenuController.m
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/8/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import "TRViewWithMenuController.h"

@interface TRViewWithMenuController ()

@property (nonatomic, strong, readonly) UIScrollView *mainScrollView;
@property (nonatomic, strong, readonly) UIView *menuView;
@property (nonatomic, strong, readonly) UIView *contentView;

@property (nonatomic, strong, readonly) UITapGestureRecognizer *contentViewTapGestureRecognizer;

@end

@implementation TRViewWithMenuController

static const CGFloat kMenuViewWidthRatio = 0.5;

- (instancetype)init {
  if (self = [super init]) {
    _mainScrollView = [[UIScrollView alloc] init];
    _mainScrollView.bounces = NO;
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.showsHorizontalScrollIndicator = NO;

    _menuView = [[UIView alloc] init];

    _contentView = [[UIView alloc] init];
  }
  return self;
}

- (void)loadView {
  [super loadView];

  [self.view addSubview:self.mainScrollView];
  [self.mainScrollView addSubview:self.menuView];
  [self.mainScrollView addSubview:self.contentView];

  CGRect bounds = self.view.bounds;
  CGFloat menuViewWidth = CGRectGetWidth(bounds) * kMenuViewWidthRatio;

  self.mainScrollView.frame = bounds;
  self.mainScrollView.contentSize = CGSizeMake(CGRectGetWidth(bounds) + menuViewWidth, CGRectGetHeight(bounds));
  self.mainScrollView.contentOffset = CGPointMake(menuViewWidth, 0);

  self.menuView.frame = CGRectMake(0, 0, menuViewWidth, CGRectGetHeight(bounds));

  self.contentView.frame = CGRectMake(menuViewWidth, 0, CGRectGetWidth(bounds), CGRectGetHeight(bounds));
}

#pragma mark - Show/hide Menu

- (void)showMenuAnimated:(BOOL)animated {
  [self.mainScrollView scrollRectToVisible:self.menuView.frame animated:animated];
}

- (void)hideMenuAnimated:(BOOL)animated {
  [self.mainScrollView scrollRectToVisible:self.contentView.frame animated:animated];
}

#pragma mark - Setters/Getters

@synthesize menuViewController = _menuViewController;
@synthesize contentViewController = _contentViewController;

- (void)setMenuViewController:(UIViewController *)menuViewController {
  if (_menuViewController != menuViewController) {
    [_menuViewController.view removeFromSuperview];
    [_menuViewController removeFromParentViewController];
    _menuViewController = menuViewController;
    [self addChildViewController:_menuViewController];
    [self.menuView addSubview:_menuViewController.view];
    _menuViewController.view.frame = self.menuView.bounds;
  }
}

- (void)setContentViewController:(UIViewController *)contentViewController {
  if (_contentViewController != contentViewController) {
    [_contentViewController.view removeFromSuperview];
    [_contentViewController removeFromParentViewController];
    _contentViewController = contentViewController;
    [self addChildViewController:_contentViewController];
    [self.contentView addSubview:_contentViewController.view];
    _contentViewController.view.frame = self.contentView.bounds;
  }
}

@end
