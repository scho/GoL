//
//  GameRandomizer.m
//  GoL
//
//  Created by Georg Meyer on 30.04.14.
//
//

#import "GameRandomizer.h"
#import "GameDimensions.h"

@interface GameRandomizer ()

@property (strong, nonatomic) NSMutableArray *gameState;
@property (strong, nonatomic) GameDimensions *gameDimensions;

@end

@implementation GameRandomizer

- (id)initWithGameDimensions:(GameDimensions *)gameDimensions {
    self = super.init;
    if (self) {
        self.gameDimensions = gameDimensions;
        self.gameState = [[NSMutableArray alloc] initWithCapacity:self.gameDimensions.height];
    }
    return self;
}

- (NSArray *)randomize {
    [self addRows];

    return self.gameState;
}

- (void)addRows {
    for (int i = 0; i < self.gameDimensions.height; i++) {
        [self addRow:i];
    }
}

- (void)addRow:(int)row {
    self.gameState[row] = [[NSMutableString alloc] initWithCapacity:self.gameDimensions.width];
    for (int i = 0; i < self.gameDimensions.width; i++) {
        self.gameState[row][i] = [NSNumber numberWithBool:[self randomCellState]];
    }
}

- (BOOL)randomCellState {
    return arc4random_uniform(2) == 1;
}

@end
