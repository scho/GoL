//
//  GameInitializer.h
//  GoL
//
//  Created by Georg Meyer on 28.04.14.
//
//

#import <Foundation/Foundation.h>
#import "GameDimensions.h"

@interface GameInitializer : NSObject

- (id) initWithInitialState:(NSArray *)initialState andGameDimensions:(GameDimensions *) gameDimensions;

- (NSArray *)initialize;

@end
