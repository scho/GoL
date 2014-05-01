//
//  CellNeighborhood.h
//  GoL
//
//  Created by Georg Meyer on 27.04.14.
//
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface CellNeighborhood : NSObject

- (void)addCell:(Cell *)cell;

- (BOOL)getNextState:(BOOL)currentState;

@end
