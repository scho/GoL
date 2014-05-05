//
//  Game.m
//  GoL
//
//  Created by Georg Meyer on 27.04.14.
//
//

#import "Cell.h"
#import "Game.h"
#import "GameInitializer.h"

@interface Game ()

@property (strong, nonatomic) NSArray *field;

@end

@implementation Game

- (id)initWithInitialState:(NSArray *)initialState andGameDimensions:(GameDimensions *)gameDimensions {
    self = [super init];
    if(self) {
        self.field = [[[GameInitializer alloc] initWithInitialState:initialState andGameDimensions:gameDimensions] initialize];
    }
    return self;
}

- (void)tick {
    [self eachCell: ^(Cell *cell) {
        [cell storeNextState];
    }];
    [self eachCell: ^(Cell *cell) {
        [cell applyNextState];
    }];
}

- (void)eachCell:(void (^)(Cell *cell))action {
    for (NSArray *row in self.field) {
        for (Cell *cell in row) {
            action(cell);
        }
    }
}



- (NSString *)description {
    NSString *result = [[NSString alloc] init];
    for (NSArray *row in self.field) {

        for (Cell *cell in row) {
            result = [result stringByAppendingString:[cell description]];
        }

        result = [result stringByAppendingString:@"\n"];
    }
    return result;
}

@end
