//
//  GameInitializer.h
//  GoL
//
//  Created by Georg Meyer on 28.04.14.
//
//

#import <Foundation/Foundation.h>
#import "Dimensions.h"

@interface GameInitializer : NSObject

- (id)initWithInitialState:(NSArray *)initialState andDimensions:(Dimensions *)dimensions;

- (NSArray *)initialize;

@end
