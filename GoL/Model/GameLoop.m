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
@property (nonatomic) BOOL killLoop;

@property (nonatomic, assign) void (^afterKill)();
@property (strong, nonatomic) dispatch_queue_t gameLoopQueue;
@end

@implementation GameLoop

- (id)initWithGame:(Game *)game andTimeInterval:(float)timeInterval andAfterTick:(void (^)()) afterTick {
    self = [super init];
    if (self) {
        self.game = game;
        self.timeInterval = timeInterval;
        self.keepLooping = NO;
        self.killLoop = NO;
        self.afterTick = afterTick;
        self.afterKill = nil;
        self.gameLoopQueue = dispatch_queue_create("Game loop", NULL);

        [self dispatchAsyncLoop];
    }
    return self;
}

- (void)dispatchAsyncLoop {
    void (^afterTick)() = self.afterTick;
    Game *game = self.game;
    GameLoop *gameLoop = self;
    self.keepLooping = YES;
    BOOL *keepLooping = &_keepLooping;
    BOOL *killLoop = &_killLoop;

    dispatch_async(self.gameLoopQueue, ^{
        while (true) {
            if (*keepLooping && !*killLoop) {
                [game tick];
                if (afterTick) {
                    afterTick();
                }
            }
            if(*killLoop) {
                NSLog(@"Kill game loop");
                dispatch_async(dispatch_get_main_queue(), ^{
                    gameLoop.afterKill();
                });

                break;
            }
            [NSThread sleepForTimeInterval:self.timeInterval];
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

- (void)killWithCallback:(void (^)()) afterKill {
    self.afterKill = afterKill;
    [self stop];
    self.killLoop = YES;
}

- (void)callAfterKill {
    self.afterKill();
}

@end
