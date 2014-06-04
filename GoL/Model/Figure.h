//
//  Figure.h
//  GoL
//
//  Created by Georg Meyer on 01.06.14.
//
//

#import <Foundation/Foundation.h>
#import "Dimensions.h"

@interface Figure : NSObject

@property (strong, nonatomic) NSMutableArray *field;
@property (strong, nonatomic) Dimensions *dimensions;

+ (Figure *)createCross;
+ (Figure *)createLightweightSpaceship;

@end
