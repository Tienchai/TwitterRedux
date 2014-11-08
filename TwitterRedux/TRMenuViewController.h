//
//  TRMenuViewController.h
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/8/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ENUM(NSUInteger, TRMenuViewItemIndex) {
  TRMenuViewProfileItemIndex,
  TRMenuViewHomeItemIndex,
  TRMenuViewMentionItemIndex,
  TRMenuViewLogoutItemIndex,
};

@class TRMenuViewController;

@protocol TRMenuViewControllerDelegate <NSObject>

- (void)menuViewController:(TRMenuViewController *)menuViewController onItemIndexDidTap:(NSUInteger)itemIndex;

@end

@interface TRMenuViewController : UITableViewController

@property (nonatomic, weak, readwrite) id<TRMenuViewControllerDelegate> delegate;

@end
