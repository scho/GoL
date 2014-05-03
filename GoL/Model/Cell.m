//
//  Cell.m
//  GoL
//
//  Created by Georg Meyer on 27.04.14.
//
//

#import "Cell.h"
#import "CellState.h"
#import "CellNeighborhood.h"

@interface Cell ()

@property (strong, nonatomic) CellState *state;
@property (strong, nonatomic) CellNeighborhood *neighborhood;

@end

@implementation Cell

- (BOOL)isAlive {
    return [self.state isAlive];
}

- (NSString *)description {
    return self.isAlive ? @"o" : @"_";
}

- (void)addNeighborCell:(Cell *)cell {
    [self.neighborhood addCell:cell];
}

- (void)storeNextState {
    BOOL currentState = self.state.isAlive;
    BOOL nextState = [self.neighborhood getNextState:currentState];
    [self.state storeNextState:nextState];
}

- (void)applyNextState {
    [self.state applyNextState];
}

- (Cell *)initWithCellState:(id)cellState {
    self = [self init];
    if (self) {
        self.state = cellState;
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        self.neighborhood = [[CellNeighborhood alloc] init];
    }
    return self;
}

+ (Cell *)createAlive {
    return [[self alloc] initWithCellState:[CellState createAlive]];
}

+ (Cell *)createDead {
    return [[self alloc] initWithCellState:[CellState createDead]];
}

@end
