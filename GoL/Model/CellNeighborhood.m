//
//  CellNeighborhood.m
//  GoL
//
//  Created by Georg Meyer on 27.04.14.
//
//

#import "CellNeighborhood.h"


@interface CellNeighborhood ()

@property (strong, nonatomic) NSMutableArray *cells;

@end

@implementation CellNeighborhood

- (void)addCell:(Cell *)cell {
    [self.cells addObject:cell];
}

- (BOOL)getNextState:(BOOL)currentState {
    if (self.stateCanChange) {
        return self.countAlive == 3;
    }
    return currentState;
}

- (id)init {
    self = [super init];
    if (self) {
        self.cells = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL)stateCanChange {
    return self.countAlive != 2;
}

- (NSInteger)countAlive {
    NSInteger count = 0;

    for (Cell *cell in self.cells) {
        if (cell.isAlive) {
            count++;
        }
    }

    return count;
}

@end
