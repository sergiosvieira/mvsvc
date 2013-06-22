//
//  BRCoreData.m
//  WorkSchedule
//
//  Created by sergio vieira on 21/06/13.
//  Copyright (c) 2013 sergio vieira. All rights reserved.
//

#import "BRCoreData.h"

#import "BRMessages.h"

@implementation BRCoreData

+ (NSArray *)fetchedObjectsWithPredicate:(NSPredicate *)predicate withEntityName:(NSString *)entityName withContext:
    (NSManagedObjectContext*)moc
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:moc];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];

    NSError *error = nil;
    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
 
    if (error)
    {
        NSLog(@"%@", [BRMessages errorMessage:error]);
    }
    
    return fetchedObjects;
}

+ (void)fetchedObjectsWithPredicate:(NSPredicate *)predicate withEntityName:(NSString *)entityName withContext:
    (NSManagedObjectContext*)moc completion:(void (^)(NSArray *))completion
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSArray *result = [self fetchedObjectsWithPredicate:predicate withEntityName:entityName withContext:moc];
        
        if (completion)
        {
            completion(result);
        }
    });
}

+ (void)saveWithContext:(NSManagedObjectContext *)moc
{
    NSError *error = nil;

    [moc save:&error];

    if (error)
    {
        NSLog(@"%@", [BRMessages errorMessage:error]);
    }
}

+ (NSFetchedResultsController *)resultsControllerWithContext:(NSManagedObjectContext *)moc withPredicate:(NSPredicate *)predicate
    withSectionNameKeyPath:(NSString *)sectionName withSortDescriptors:(NSArray *)sortDescriptors withEntity:(NSString *)entityName
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:moc];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *result = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
        managedObjectContext:moc sectionNameKeyPath:sectionName cacheName:nil];
    
    return result;
}

/**
    @description return a array of sort descriptors from dictionary
    @in [{ "key" : "key name", "ascending": NSNumber(<YES or NO>) }]
*/
+ (NSArray *)sortDescriptorsFromInfo:(NSArray *)arrayOfInfo
{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:[arrayOfInfo count]];
    
    for (NSDictionary *info in arrayOfInfo)
    {
        NSString *key = info[@"key"];
        NSNumber *ascendingNumber = info[@"ascending"];
        BOOL ascending = [ascendingNumber boolValue];
        
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
        
        [result addObject:sortDescriptor];
    }
    
    return result;
}

+ (void)performFetchWithResultsController:(NSFetchedResultsController *)resultsController
{
    NSError *error = nil;
    BOOL success = NO;
    
    @try
    {
        success = [resultsController performFetch:&error];
    }
    @catch (NSException *exception)
    {
         NSLog(@"%@", [BRMessages exceptionMessage:exception]);
    }
    
    if (!success)
    {
        NSLog(@"%@", [BRMessages unresolvedErrorMessage:error]);
    }
}

@end
