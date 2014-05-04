//
//  GameInitializer.m
//  GoL
//
//  Created by Georg Meyer on 28.04.14.
//
//

#import "Cell.h"
#import "GameDimensions.h"
#import "GameInitializer.h"
#import "NeighborhoodInitializer.h"

@interface GameInitializer ()

@property (strong, nonatomic) NSArray *initialState;
@property (strong, nonatomic) NSMutableArray *field;
@property (strong, nonatomic) NeighborhoodInitializer *neighborhoodInitializer;

@property (strong, nonatomic) GameDimensions *gameDimensions;

@end


@implementation GameInitializer

- (id)initWithInitialState:(NSArray *)initialState andGameDimensions:(GameDimensions *)gameDimensions {
    self = [super init];
    if (self) {
        self.initialState = initialState;
        self.gameDimensions = gameDimensions;
        self.field = [[NSMutableArray alloc] initWithCapacity:self.gameDimensions.height];

        self.neighborhoodInitializer = [[NeighborhoodInitializer alloc] initWithField:self.field andGameDimensions:self.gameDimensions];
    }
    return self;
}

- (NSArray *)initialize {
    [self setUpGame];
    return self.field;
}

- (void)setUpGame {
    for (NSArray *rowState in self.initialState) {
        [self setUpRow:rowState];
    }
}

- (void)setUpRow:(NSArray *)rowState {
    NSMutableArray *row = [[NSMutableArray alloc] initWithCapacity:self.gameDimensions.width];
    [self.field addObject:row];

    for (int i = 0; i < rowState.count; i++) {
        BOOL isAlive = [[rowState objectAtIndex:i] boolValue];
        [self setUpCell:isAlive];
    }
}

- (void)setUpCell:(BOOL)isAlive {
    Cell *cell = isAlive ? [Cell createAlive] : [Cell createDead];
    [self addCell:cell];

    [self.neighborhoodInitializer initializeCell:cell];
}

- (void)addCell:(Cell *)cell {
    [[self.field lastObject] addObject:cell];
}

@end
