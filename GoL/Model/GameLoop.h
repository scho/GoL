//
//  GameLoop.h
//  GoL
//
//  Created by Georg Meyer on 03.05.14.
//
//

#import <Foundation/Foundation.h>
#import "Game.h"

@interface GameLoop : NSObject

- (id)initWithGame:(Game *)game andTimeInterval:(float)timeInterval andAfterTick:(void (^)()) afterTick;

- (void)start;
- (void)stop;
- (void)killWithCallback:(void (^)()) afterKill;

@property (nonatomic, assign) void (^afterTick)();

@end
