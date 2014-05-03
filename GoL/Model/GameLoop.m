//
//  GameLoop.m
//  GoL
//
//  Created by Georg Meyer on 03.05.14.
//
//

#import "GameLoop.h"
#import "Game.h"

@interface GameLoop ()

@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation GameLoop

- (id)initWithGame:(Game *)game andTimeInterval:(int)timeInterval {
    self = [super init];
    if(self) {
        self.game = game;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)start
{
}

- (void)stop
{
    [self.timer invalidate];
}

- (void)timerFired:(NSTimer*)theTimer
{
    [self.game tick];
    if(self.tickHook) {
        self.tickHook();
    }
}

@end
