//
//  BRTableController.h
//  WorkSchedule
//
//  Created by sergio vieira on 19/06/13.
//  Copyright (c) 2013 sergio vieira. All rights reserved.
//

#import <UIKit/UIKit.h>


@class BRController;

@protocol TableControllerProtocol <NSObject>

@required
- (id)initWithParent:(BRController *)aParent;

@property (strong, nonatomic) BRController *parent;

@end

@interface BRTableController : UITableViewController<TableControllerProtocol>

@end
