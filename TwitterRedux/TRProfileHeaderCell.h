//
//  TRProfileHeaderCell.h
//  TwitterRedux
//
//  Created by Tienchai Wirojsaksaree on 11/9/14.
//  Copyright (c) 2014 Tienchai Wirojsaksaree. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TRTwitterUser.h"

@interface TRProfileHeaderCell : UITableViewCell

@property (nonatomic, strong, readwrite) TRTwitterUser *user;

@end
