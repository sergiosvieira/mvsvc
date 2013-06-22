//
//  BRMessages.m
//  WorkSchedule
//
//  Created by sergio vieira on 21/06/13.
//  Copyright (c) 2013 sergio vieira. All rights reserved.
//

#import "BRMessages.h"


@implementation BRMessages

+ (NSString *)errorMessage:(NSError *)error
{
    NSString *errorMessage = NSLocalizedString(@"DBG_ERROR_MSG", nil);
    
    return [NSString stringWithFormat:@"%@: %@", errorMessage, error];
}

+ (NSString *)exceptionMessage:(NSException *)exception
{
    NSString *errorMessage = NSLocalizedString(@"DBG_EXCEPTION_MSG", nil);
    
    return [NSString stringWithFormat:@"%@: %@", errorMessage, exception];
}

+ (NSString *)unresolvedErrorMessage:(NSError *)error
{
    NSString *errorMessage = NSLocalizedString(@"DBG_UNRESOLVED_ERROR_MSG", nil);
    
    return [NSString stringWithFormat:@"%@ %@, %@", errorMessage, error, [error userInfo]];
}

@end
