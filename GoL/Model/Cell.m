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

@interface Cell()

@property (strong, nonatomic) CellState *cellState;
@property (strong, nonatomic) CellNeighborhood *cellNeighborhood;

@end

@implementation Cell

- (BOOL) isAlive {
    return [self.cellState isAlive];
}

- (void) addNeighborCell:(Cell *)cell{
    [self.cellNeighborhood addCell:cell];
}

- (void) storeNextState{
    BOOL currentState = self.cellState.isAlive;
    BOOL nextState = [self.cellNeighborhood getNextState:currentState];
    [self.cellState storeNextState:nextState];
}

- (void) applyNextState{
    [self.cellState applyNextState];
}

- (Cell *) initWithCellState:(id)cellState{
    self = [self init];
    if (self) {
        self.cellState = cellState;
    }
    return self;
}

- (id) init{
    self = [super init];
    if(self){
        self.cellNeighborhood = [[CellNeighborhood alloc] init];
    }
    return self;
}

+ (Cell *) createAlive{
    return [[self alloc] initWithCellState:[CellState createAlive]];
}

+ (Cell *) createDead{
    return [[self alloc] initWithCellState:[CellState createDead]];
}

@end
