//
//  RandomStrategy.m
//  GoL
//
//  Created by Georg Meyer on 01.06.14.
//
//

#import "RandomStrategy.h"

@implementation RandomStrategy

- (BOOL)getState {
    return arc4random_uniform(2) == 1;
}

@end
