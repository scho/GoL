//
//  GameRandomizer.h
//  GoL
//
//  Created by Georg Meyer on 30.04.14.
//
//

#import <Foundation/Foundation.h>
#import "GameDimensions.h"

@interface GameRandomizer : NSObject

- (id) initWithGameDimensions:(GameDimensions *)gameDimensions;

- (NSArray *)randomize;

@end
