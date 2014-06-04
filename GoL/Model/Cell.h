//
//  Cell.h
//  GoL
//
//  Created by Georg Meyer on 27.04.14.
//
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

- (BOOL)isAlive;
- (void)addNeighborCell:(Cell *)cell;
- (void)storeNextState;
- (void)applyNextState;
- (void)die;
- (void)becomeAlive;

+ (Cell *)createAlive;
+ (Cell *)createDead;

@end
