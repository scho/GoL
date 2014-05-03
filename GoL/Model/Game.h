//
//  Game.h
//  GoL
//
//  Created by Georg Meyer on 27.04.14.
//
//

#import <Foundation/Foundation.h>
#import "GameDimensions.h"

@interface Game : NSObject

- (id)initWithInitialState:(NSArray *)initialState andGameDimensions:(GameDimensions *)gameDimensions;

- (void)tick;
- (NSArray *)descriptionArray;

@end
