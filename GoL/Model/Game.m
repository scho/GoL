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
#import "Dimensions.h"

#import "GameStateInitializer.h"

@interface Game ()

@property (strong, nonatomic) NSArray *field;
@property (strong, nonatomic) Dimensions *dimensions;

@property (strong, nonatomic) GameStateInitializer *gameStateInitializer;

@end

@implementation Game

- (id)initWithDimensions:(Dimensions *)dimensions andGameStateInitializer:(GameStateInitializer *)gameStateInitializer {
    self = [super init];
    if (self) {
        self.dimensions = dimensions;
        self.gameStateInitializer = gameStateInitializer;
        [self createField];
    }
    return self;
}

- (void)createField {
    self.field = [[[GameInitializer alloc] initWithInitialState:[self.gameStateInitializer generateGameState] andDimensions:[self dimensions]] initialize];
}

- (void)tick {
    [self eachCell: ^(Cell *cell) {
        [cell storeNextState];
    }];
    [self eachCell: ^(Cell *cell) {
        [cell applyNextState];
    }];
}

- (void)addFigure:(Figure *)figure {
    int y = 10;
    for(int i = 0; i < figure.dimensions.height; i++) {
        int x = 10;
        for(int j = 0; j < figure.dimensions.width; j++) {
            Cell *cell = [[self.field objectAtIndex:y] objectAtIndex:x];
            NSLog(@"cell");
            if([[[figure.field objectAtIndex:i] objectAtIndex:j] boolValue]) {
                [cell becomeAlive];
            } else{
                [cell die];
            }
            x++;
        }
        y++;
    }
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
