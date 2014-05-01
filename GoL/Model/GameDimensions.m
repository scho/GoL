//
//  GameDimensions.m
//  GoL
//
//  Created by Georg Meyer on 29.04.14.
//
//

#import "GameDimensions.h"

@implementation GameDimensions

- (id)initWithHeight:(NSInteger)height andWidth:(NSInteger)width {
    self = [super init];

    if (self) {
        self.height = height;
        self.width = width;
    }

    return self;
}

@end
