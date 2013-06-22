//
//  BRController.h
//  WorkSchedule
//
//  Created by sergio vieira on 19/06/13.
//  Copyright (c) 2013 sergio vieira. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BRTableController, BRModel, BRView;

@protocol ControllerProtocol <NSObject>

@required
- (UITableView *)tableView;

@property (strong, nonatomic) BRTableController *tableController;
@property (strong, nonatomic) BRModel *model;
@property (strong, nonatomic) BRView *viewCell;

@optional
- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (BOOL)canEditRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath;
- (BOOL)canMoveRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface BRController : UIViewController<ControllerProtocol>

@end
