//
//  CellState.m
//  GoL
//
//  Created by Georg Meyer on 27.04.14.
//
//

#import "CellState.h"

@interface CellState ()

@property (nonatomic) BOOL currentState;

@property (nonatomic) BOOL nextState;

@end


@implementation CellState

- (BOOL)isAlive {
    return self.currentState;
}

- (void)applyNextState {
    self.currentState = self.nextState;
}

- (void)storeNextState:(BOOL)value {
    self.nextState = value;
}

+ (CellState *)createAlive {
    return [[self alloc] initWithCurrentState:YES];
}

+ (CellState *)createDead {
    return [[self alloc] initWithCurrentState:NO];
}

- (CellState *)initWithCurrentState:(BOOL)currentState {
    self = [super init];
    if (self) {
        self.currentState = currentState;
    }
    return self;
}

@end
