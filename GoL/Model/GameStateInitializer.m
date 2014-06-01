//
//  GameRandomizer.m
//  GoL
//
//  Created by Georg Meyer on 30.04.14.
//
//

#import "GameDimensions.h"
#import "GameStateInitializer.h"
#import "GameStateInitializerStrategy.h"

@interface GameStateInitializer ()

@property (strong, nonatomic) NSMutableArray *gameState;
@property (strong, nonatomic) GameDimensions *gameDimensions;

@property (nonatomic, readwrite) id <GameStateInitializerStrategy> gameStateInitializerStrategy;


@end

@implementation GameStateInitializer

- (id)initWithGameDimensions:(GameDimensions *)gameDimensions andGameStateInitializerStrategy:(id <GameStateInitializerStrategy> )gameStateInitializerStrategy {
    self = super.init;
    if (self) {
        self.gameDimensions = gameDimensions;
        self.gameState = [[NSMutableArray alloc] initWithCapacity:self.gameDimensions.height];
        self.gameStateInitializerStrategy = gameStateInitializerStrategy;
    }
    return self;
}

- (NSArray *)generateGameState {
    [self addRows];

    return self.gameState;
}

- (void)addRows {
    for (int i = 0; i < self.gameDimensions.height; i++) {
        [self addRow:i];
    }
}

- (void)addRow:(int)row {
    self.gameState[row] = [[NSMutableArray alloc] initWithCapacity:self.gameDimensions.width];
    for (int i = 0; i < self.gameDimensions.width; i++) {
        self.gameState[row][i] = [NSNumber numberWithBool:[self cellState]];
    }
}

- (BOOL)cellState {
    return [self.gameStateInitializerStrategy getState];
}

@end
