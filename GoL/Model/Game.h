//
//  Game.h
//  GoL
//
//  Created by Georg Meyer on 27.04.14.
//
//

#import <Foundation/Foundation.h>
#import "Dimensions.h"
#import "Figure.h"
#import "GameStateInitializer.h"

@interface Game : NSObject

- (id)initWithDimensions:(Dimensions *)dimensions andGameStateInitializer:(GameStateInitializer *)gameStateInitializer;

- (void)tick;

- (void)createField;

- (void)addFigure:(Figure *)figure;

@end
