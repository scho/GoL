//
//  Game.m
//  GoL
//
//  Created by Georg Meyer on 27.04.14.
//
//

#import "Game.h"
#import "Cell.h"

@interface Game()

@property (strong, nonatomic) NSArray *rows;

@end

@implementation Game

- (void) tick{
    [self eachCell:^(Cell *cell){
        [cell storeNextState];
    }];
    [self eachCell:^(Cell *cell){
        [cell applyNextState];
    }];
}

- (void) eachCell:(void (^)(Cell *cell))action{
    for(NSArray *row in self.rows){
        for(Cell *cell in row){
            action(cell);
        }
    }
}

@end
