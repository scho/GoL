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
    NSMutableString *result = [[NSMutableString alloc] init];
    for (NSArray *row in self.field) {

        for (Cell *cell in row) {
            [result appendString:[cell description]];
        }

        [result appendString:@"\n"];
    }
    return result;
}

@end
