//
//  GameRandomizer.h
//  GoL
//
//  Created by Georg Meyer on 30.04.14.
//
//

#import <Foundation/Foundation.h>
#import "GameDimensions.h"
#import "GameStateInitializerStrategy.h"

@interface GameStateInitializer : NSObject

- (id)initWithGameDimensions:(GameDimensions *)gameDimensions andGameStateInitializerStrategy:(id <GameStateInitializerStrategy> )gameStateInitializerStrategy;

- (NSArray *)generateGameState;

@end
