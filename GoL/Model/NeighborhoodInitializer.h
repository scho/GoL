//
//  NeighborhoodInitializer.h
//  GoL
//
//  Created by Georg Meyer on 28.04.14.
//
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface NeighborhoodInitializer : NSObject

- (void) initializeCell:(Cell *)cell;

- (id) initWithField:(NSMutableArray *)field andHeight:(NSInteger)height andWidth:(NSInteger)width;

@end
