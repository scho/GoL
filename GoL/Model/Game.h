//
//  Game.h
//  GoL
//
//  Created by Georg Meyer on 27.04.14.
//
//

#import <Foundation/Foundation.h>
#import "GameDimensions.h"
#import "GameStateInitializer.h"

@interface Game : NSObject

- (id)initWithGameDimensions:(GameDimensions *)gameDimensions andGameStateInitializer:(GameStateInitializer *)gameStateInitializer;

- (void)tick;

- (void)createField;

@end
