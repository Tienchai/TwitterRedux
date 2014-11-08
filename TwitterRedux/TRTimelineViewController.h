//
//  TRTimelineViewController.h
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/8/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRTimelineViewController : UITableViewController

- (instancetype)initWithTitle:(NSString *)title timelineGetSelector:(SEL)timelineGetSelector;

@end
