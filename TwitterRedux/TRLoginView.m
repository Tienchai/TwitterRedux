//
//  TRLoginView.m
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/8/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import "TRLoginView.h"

#import "TRMainViewController.h"
#import "TRTwitterClient.h"
#import "TRTwitterUser.h"

@interface TRLoginView ()

@property (nonatomic, strong, readonly) UIButton *loginButton;

@end

@implementation TRLoginView

- (instancetype)init {
  if (self = [super init]) {
    _loginButton = [[UIButton alloc] init];
    [_loginButton setTitle:@"Login with Twitter" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(onLoginButtonTap) forControlEvents:UIControlEventTouchUpInside];
  }
  return self;
}

- (void)loadView {
  [super loadView];

  self.view.backgroundColor = [UIColor colorWithRed:192.0/255 green:1 blue:1 alpha:1];
  [self.view addSubview:self.loginButton];

  CGRect bounds = self.view.bounds;

  CGSize logingButtonSize = [self.loginButton sizeThatFits:bounds.size];

  self.loginButton.frame = CGRectMake((CGRectGetWidth(bounds) - logingButtonSize.width) / 2,
                                      (CGRectGetHeight(bounds) - logingButtonSize.height) / 2,
                                      logingButtonSize.width,
                                      logingButtonSize.height);
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  if ([TRTwitterUser currentUser]) {
    [self onLoginSuccessfully];
  }
}

- (void)onLoginButtonTap {
  [[TRTwitterClient sharedInstance] loginWithSuccess:^(TRTwitterUser *user) {
    [TRTwitterUser setCurrentUser:user];
    [self onLoginSuccessfully];
  } failure:^(NSError *error) {
    NSLog(@"Error login: %@", error);
  }];
}

- (void)onLoginSuccessfully {
  [self presentViewController:[[TRMainViewController alloc] init] animated:YES completion:nil];
}

@end
