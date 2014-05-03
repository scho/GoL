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

@property (nonatomic) float timeInterval;
@property (strong, nonatomic) Game *game;
@property (nonatomic) BOOL keepLooping;

@end

@implementation GameLoop

- (id)initWithGame:(Game *)game andTimeInterval:(float)timeInterval {
    self = [super init];
    if (self) {
        self.game = game;
        self.timeInterval = timeInterval;
        self.keepLooping = NO;
    }
    return self;
}

- (void)start {
    if(self.keepLooping) {
        return;
    }

    void (^afterTick)() = self.afterTick;
    Game *game = self.game;
    self.keepLooping = YES;
    BOOL *keepLooping = &_keepLooping;

    dispatch_queue_t gameLoopQueue = dispatch_queue_create("Game loop", NULL);
    dispatch_async(gameLoopQueue, ^{
        while (true) {
            [game tick];
            if (afterTick) {
                afterTick();
            }
            [NSThread sleepForTimeInterval:self.timeInterval];

            if (!*keepLooping) {
                break;
            }
        }
    });
}

- (void)stop {
    self.keepLooping = NO;
}

@end
