//
//  BRMessages.h
//  WorkSchedule
//
//  Created by sergio vieira on 21/06/13.
//  Copyright (c) 2013 sergio vieira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BRMessages : NSObject

+ (NSString *)errorMessage:(NSError *)error;
+ (NSString *)exceptionMessage:(NSException *)exception;
+ (NSString *)unresolvedErrorMessage:(NSError *)error;

@end
