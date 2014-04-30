//
//  GameRandomizer.m
//  GoL
//
//  Created by Georg Meyer on 30.04.14.
//
//

#import "GameRandomizer.h"
#import "GameDimensions.h"

@interface GameRandomizer()

@property (strong, nonatomic) NSMutableArray *gameState;
@property (strong, nonatomic) GameDimensions *gameDimensions;

@end

@implementation GameRandomizer

- (id) initWithGameDimensions:(GameDimensions *)gameDimensions{
    self = super.init;
    if(self){
        self.gameDimensions = gameDimensions;
        self.gameState = [[NSMutableArray alloc] initWithCapacity:self.gameDimensions.height];
    }
    return self;
}

- (NSArray *)randomize{
    return nil;
}

@end
