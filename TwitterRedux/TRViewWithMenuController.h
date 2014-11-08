//
//  TRViewWithMenuController.h
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/8/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRViewWithMenuController : UIViewController

@property (nonatomic, strong, readwrite) UIViewController *menuViewController;
@property (nonatomic, strong, readwrite) UIViewController *contentViewController;

- (void)showMenuAnimated:(BOOL)animated;
- (void)hideMenuAnimated:(BOOL)animated;

@end
