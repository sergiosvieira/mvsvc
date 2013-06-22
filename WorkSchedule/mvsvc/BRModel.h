//
//  BRModel.h
//  WorkSchedule
//
//  Created by sergio vieira on 19/06/13.
//  Copyright (c) 2013 sergio vieira. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ModelProtocol

@required
- (NSFetchedResultsController *)createDataSource;

@end

@interface BRModel : NSObject<ModelProtocol>

@property (strong, nonatomic) NSFetchedResultsController *resultsController;

@end
