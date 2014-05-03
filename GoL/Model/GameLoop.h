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

- (id) initWithGame:(Game *)game andTimeInterval:(int)timeInterval;
- (void)start;
- (void)stop;

@property (nonatomic, assign) void (^tickHook)();


@end
