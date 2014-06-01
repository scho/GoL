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
@property (nonatomic, assign) void (^afterTick)();

@end

@implementation GameLoop

- (id)initWithGame:(Game *)game andTimeInterval:(float)timeInterval andAfterTick:(void (^)()) afterTick {
    self = [super init];
    if (self) {
        self.game = game;
        self.timeInterval = timeInterval;
        self.keepLooping = NO;
        self.afterTick = afterTick;

        [self dispatchAsyncLoop];
    }
    return self;
}

- (void)dispatchAsyncLoop {
    void (^afterTick)() = self.afterTick;
    Game *game = self.game;
    self.keepLooping = YES;
    BOOL *keepLooping = &_keepLooping;

    dispatch_queue_t gameLoopQueue = dispatch_queue_create("Game loop", NULL);
    dispatch_async(gameLoopQueue, ^{
        while (true) {
            if (*keepLooping) {
                [game tick];
                if (afterTick) {
                    afterTick();
                }
                [NSThread sleepForTimeInterval:self.timeInterval];
            }
        }
    });
}

- (void)start {
    self.keepLooping = YES;
    NSLog(@"Start game loop");
}

- (void)stop {
    self.keepLooping = NO;
    NSLog(@"Stop game loop");
}

@end
