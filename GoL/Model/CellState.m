//
//  CellState.m
//  GoL
//
//  Created by Georg Meyer on 27.04.14.
//
//

#import "CellState.h"

@interface CellState()

@property (nonatomic) BOOL currentState;

@property (nonatomic) BOOL nextState;

@end


@implementation CellState

- (BOOL) isAlive{
    return _currentState;
}

- (void) applyNextState{
    _currentState = _nextState;
}

- (void) storeNextState:(BOOL)value {
    _nextState = value;
}

+ (CellState *) createAlive{
    return [[self alloc] initWithCurrentState:true];
}

+ (CellState *) createDead{
    return [[self alloc] initWithCurrentState:false];
}

- (CellState *) initWithCurrentState:(BOOL)currentState{
    self = [super init];
    if (self) {
        self.currentState = currentState;
    }
    return self;
}

@end
