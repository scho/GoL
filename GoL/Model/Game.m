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
#import "GameDimensions.h"
#import "GameRandomizer.h"

@interface Game ()

@property (strong, nonatomic) NSArray *field;
@property (strong, nonatomic) GameDimensions *gameDimensions;
@property (strong, nonatomic) GameRandomizer *gameRandomizer;
@property (nonatomic) BOOL isCreatingField;

@end

@implementation Game

- (id)initWithGameDimensions:(GameDimensions *)gameDimensions {
    self = [super init];
    if(self) {
        self.gameDimensions = gameDimensions;
        self.gameRandomizer = [[GameRandomizer alloc] initWithGameDimensions:gameDimensions];
        [self createField];
    }
    return self;
}

// tick und buildField dürfen nicht gleichzeitig aus geführt werden. Daher kommt isBuildingField.
// Das muss man denke ich in verschiedene Threads packen. Spielaufbau -> Spiel -> Spielende -> Spielaufbau...

- (void) createField {
    self.isCreatingField = YES;
    self.field = [[[GameInitializer alloc] initWithInitialState:[self.gameRandomizer randomize] andGameDimensions:[self gameDimensions]] initialize];
    self.isCreatingField = NO;
}

- (void)tick {
    if (!self.isCreatingField){
        [self eachCell: ^(Cell *cell) {
            [cell storeNextState];
        }];
        [self eachCell: ^(Cell *cell) {
            [cell applyNextState];
        }];
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
