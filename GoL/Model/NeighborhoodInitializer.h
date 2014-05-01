//
//  NeighborhoodInitializer.h
//  GoL
//
//  Created by Georg Meyer on 28.04.14.
//
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "GameDimensions.h"

@interface NeighborhoodInitializer : NSObject

- (void)initializeCell:(Cell *)cell;

- (id)initWithField:(NSMutableArray *)field andGameDimensions:(GameDimensions *)gameDimensions;

@end
