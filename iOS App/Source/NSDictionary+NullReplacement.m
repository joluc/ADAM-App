//
//  NSDictionary+NullReplacement.m
//  ADAM - Ausbau der Digitalisierung im Anlagenmanagement
//
//  Created by Jonathan Lucas Fritz on 16.08.16.
//  Copyright © 2016 NOSCIO. All rights reserved.
//
#import "NSArray+NullReplacement.h"
#import "NSDictionary+NullReplacement.h"

@implementation NSArray (NullReplacement)

- (NSArray *)arrayByReplacingNullsWithBlanks  {
    NSMutableArray *replaced = [self mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    for (int idx = 0; idx < [replaced count]; idx++) {
        id object = [replaced objectAtIndex:idx];
        if (object == nul) [replaced replaceObjectAtIndex:idx withObject:blank];
        else if ([object isKindOfClass:[NSDictionary class]]) [replaced replaceObjectAtIndex:idx withObject:[object dictionaryByReplacingNullsWithBlanks]];
        else if ([object isKindOfClass:[NSArray class]]) [replaced replaceObjectAtIndex:idx withObject:[object arrayByReplacingNullsWithBlanks]];
    }
    return [replaced copy];
}

@end