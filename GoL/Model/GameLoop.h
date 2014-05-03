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

- (id)initWithGame:(Game *)game andTimeInterval:(float)timeInterval;
- (void)start;
- (void)stop;

@property (nonatomic, assign) void (^afterTick)();

@end
