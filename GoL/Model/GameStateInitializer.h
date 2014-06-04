//
//  GameRandomizer.h
//  GoL
//
//  Created by Georg Meyer on 30.04.14.
//
//

#import <Foundation/Foundation.h>
#import "Dimensions.h"
#import "GameStateInitializerStrategy.h"

@interface GameStateInitializer : NSObject

- (id)initWithDimensions:(Dimensions *)dimensions andGameStateInitializerStrategy:(id <GameStateInitializerStrategy> )gameStateInitializerStrategy;

- (NSArray *)generateGameState;

@end
