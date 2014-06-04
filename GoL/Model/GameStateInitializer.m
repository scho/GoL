//
//  GameRandomizer.m
//  GoL
//
//  Created by Georg Meyer on 30.04.14.
//
//

#import "Dimensions.h"
#import "GameStateInitializer.h"
#import "GameStateInitializerStrategy.h"

@interface GameStateInitializer ()

@property (strong, nonatomic) NSMutableArray *gameState;
@property (strong, nonatomic) Dimensions *dimensions;

@property (nonatomic, readwrite) id <GameStateInitializerStrategy> gameStateInitializerStrategy;


@end

@implementation GameStateInitializer

- (id)initWithDimensions:(Dimensions *)dimensions andGameStateInitializerStrategy:(id <GameStateInitializerStrategy> )gameStateInitializerStrategy {
    self = super.init;
    if (self) {
        self.dimensions = dimensions;
        self.gameState = [[NSMutableArray alloc] initWithCapacity:self.dimensions.height];
        self.gameStateInitializerStrategy = gameStateInitializerStrategy;
    }
    return self;
}

- (NSArray *)generateGameState {
    [self addRows];

    return self.gameState;
}

- (void)addRows {
    for (int i = 0; i < self.dimensions.height; i++) {
        [self addRow:i];
    }
}

- (void)addRow:(int)row {
    self.gameState[row] = [[NSMutableArray alloc] initWithCapacity:self.dimensions.width];
    for (int i = 0; i < self.dimensions.width; i++) {
        self.gameState[row][i] = [NSNumber numberWithBool:[self cellState]];
    }
}

- (BOOL)cellState {
    return [self.gameStateInitializerStrategy getState];
}

@end
