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
#import "GameStateInitializer.h"

@interface Game ()

@property (strong, nonatomic) NSArray *field;
@property (strong, nonatomic) GameDimensions *gameDimensions;

@property (nonatomic) BOOL isCreatingField;

@property (strong, nonatomic) GameStateInitializer *gameStateInitializer;

@end

@implementation Game

- (id)initWithGameDimensions:(GameDimensions *)gameDimensions andGameStateInitializer:(GameStateInitializer *)gameStateInitializer {
    self = [super init];
    if (self) {
        self.gameDimensions = gameDimensions;
        [self createField];

        self.gameStateInitializer = gameStateInitializer;
        [self createField];

        self.isCreatingField = NO;
    }
    return self;
}

// tick und buildField dürfen nicht gleichzeitig aus geführt werden. Daher kommt isBuildingField.
// Das muss man denke ich in verschiedene Threads packen. Spielaufbau -> Spiel -> Spielende -> Spielaufbau...

- (void)createField {
    self.isCreatingField = YES;
    self.field = [[[GameInitializer alloc] initWithInitialState:[self.gameStateInitializer generateGameState] andGameDimensions:[self gameDimensions]] initialize];
    self.isCreatingField = NO;
}

- (void)tick {
    if (!self.isCreatingField) {
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
