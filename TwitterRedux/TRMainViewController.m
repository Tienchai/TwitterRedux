//
//  TRMainViewController.m
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/8/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import "TRMainViewController.h"

#import "TRLoginView.h"
#import "TRMenuViewController.h"
#import "TRProfileViewController.h"
#import "TRTimelineViewController.h"
#import "TRTwitterUser.h"

@interface TRMainViewController () <TRMenuViewControllerDelegate>

@property (nonatomic, strong, readonly) TRMenuViewController *mainMenuViewController;
@property (nonatomic, strong, readonly) NSArray *menuItemViewControllers;

@end

@implementation TRMainViewController

- (instancetype)init {
  if (self = [super init]) {
    _mainMenuViewController = [[TRMenuViewController alloc] init];
    _mainMenuViewController.delegate = self;

    TRProfileViewController *profileViewController = [[TRProfileViewController alloc] init];
    profileViewController.user = [TRTwitterUser currentUser];

    _menuItemViewControllers = @[profileViewController,
                                 [self createTimelineWithNavigationWithTitle:@"Home" timelineGetSelector:@selector(getHomeTimelineWithSuccess:failure:)],
                                 [self createTimelineWithNavigationWithTitle:@"Mention" timelineGetSelector:@selector(getMentionTimelineWithSuccess:failure:)],
                                 ];

    self.menuViewController = self.mainMenuViewController;
    self.contentViewController = _menuItemViewControllers[1];
  }
  return self;
}

- (UINavigationController *)createTimelineWithNavigationWithTitle:(NSString *)title timelineGetSelector:(SEL)timelineGetSelector {
  TRTimelineViewController *timelineViewController = [[TRTimelineViewController alloc] initWithTitle:title timelineGetSelector:timelineGetSelector];
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:timelineViewController];
  navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:85.0/255 green:172.0/255 blue:238.0/255 alpha:1];
  return navigationController;
}

#pragma mark - TRMenuViewControllerDelegate

- (void)menuViewController:(TRMenuViewController *)menuViewController onItemIndexDidTap:(NSUInteger)itemIndex {
  if (itemIndex == TRMenuViewLogoutItemIndex) {
    [TRTwitterUser setCurrentUser:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
  } else {
    self.contentViewController = self.menuItemViewControllers[itemIndex];
    [self hideMenuAnimated:YES];
  }
}

@end
