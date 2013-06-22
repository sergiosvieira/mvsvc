//
//  BRModel.m
//  WorkSchedule
//
//  Created by sergio vieira on 19/06/13.
//  Copyright (c) 2013 sergio vieira. All rights reserved.
//

#import "BRModel.h"

@implementation BRModel

#pragma mark - Lazy Instantiating
- (NSFetchedResultsController *)resultsController
{
    if (!_resultsController)
    {
        _resultsController = [self createDataSource];
    }
    
    return _resultsController;
}

#pragma mark - Model Protocol
- (NSFetchedResultsController *)createDataSource
{
    return nil;
}


@end
