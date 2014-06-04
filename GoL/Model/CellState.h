//
//  CellState.h
//  GoL
//
//  Created by Georg Meyer on 27.04.14.
//
//

#import <Foundation/Foundation.h>

@interface CellState : NSObject

- (BOOL)isAlive;
- (void)applyNextState;
- (void)storeNextState:(BOOL)value;
- (void)die;
-(void)becomeAlive;

+ (CellState *)createAlive;
+ (CellState *)createDead;

@end
