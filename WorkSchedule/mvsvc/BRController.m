//
//  BRController.m
//  WorkSchedule
//
//  Created by sergio vieira on 19/06/13.
//  Copyright (c) 2013 sergio vieira. All rights reserved.
//

#import "BRController.h"

#import "BRContants.h"
#import "BRModel.h"
#import "BRTableController.h"
#import "BRView.h"

@interface BRController ()

- (void)didload;

@end

@implementation BRController

@synthesize tableController = _tableController, model = _model, viewCell = _viewCell;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self didload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Lazy Instatiating
- (BRTableController *)tableController
{
    if (!_tableController)
    {
        _tableController = [[BRTableController alloc] initWithParent:self];
    }
    
    return _tableController;
}

- (BRModel *)model
{
    if (!_model)
    {
        _model = [[BRModel alloc] init];
    }
    
    return _model;
}

- (BRView *)viewCell
{
    if (!_viewCell)
    {
        _viewCell = [[BRView alloc] init];
    }
    
    return _viewCell;
}

#pragma mark - ControllerProtocol
- (UITableView *)tableView
{
    return self.tableController.tableView;
}

- (NSInteger)numberOfSections
{
    return [self.model.resultsController.fetchedObjects count];
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    return [self.model.resultsController.sections[section] count];
}

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kDefaultCellIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (BOOL)canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}

- (BOOL)canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

#pragma mark - Private Methods
- (void)didload
{
    /** table controller **/
    if (![UIApplication sharedApplication].isStatusBarHidden)
    {
        CGRect frame = self.tableController.view.frame;
        
        frame.origin.y = 0.f;
        self.tableController.view.frame = frame;
    }
    
    [self.view addSubview:self.tableController.view];
}

@end
