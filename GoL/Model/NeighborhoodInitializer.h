//
//  NeighborhoodInitializer.h
//  GoL
//
//  Created by Georg Meyer on 28.04.14.
//
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Dimensions.h"

@interface NeighborhoodInitializer : NSObject

- (void)initializeCell:(Cell *)cell;

- (id)initWithField:(NSMutableArray *)field andDimensions:(Dimensions *)dimensions;

@end
