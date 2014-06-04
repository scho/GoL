//
//  Figure.m
//  GoL
//
//  Created by Georg Meyer on 01.06.14.
//
//

#import "Figure.h"

@implementation Figure

+ (Figure *)createCross {
    Figure *cross = [[self alloc] init];

    cross.dimensions = [[Dimensions alloc] initWithHeight:3 andWidth:3];
    cross.field = [[NSMutableArray alloc] initWithCapacity:cross.dimensions.height];

    [cross addLine: @"_o_"];
    [cross addLine: @"_o_"];
    [cross addLine: @"_o_"];

    return cross;
}

+ (Figure *)createLightweightSpaceship {
    Figure *cross = [[self alloc] init];

    cross.dimensions = [[Dimensions alloc] initWithHeight:4 andWidth:5];
    cross.field = [[NSMutableArray alloc] initWithCapacity:cross.dimensions.height];

    [cross addLine: @"o__o_"];
    [cross addLine: @"____o"];
    [cross addLine: @"o___o"];
    [cross addLine: @"_oooo"];
    return cross;
}


- (void)addLine:(NSString *)line {
    NSMutableArray *row = [[NSMutableArray alloc] initWithCapacity:self.dimensions.width];

    for(int i = 0; i < line.length; i++) {
        NSRange range = NSMakeRange(i, 1);

        [row addObject :[NSNumber numberWithBool:[[line substringWithRange:range] isEqualToString:@"o"]]];
    }

    [self.field addObject:row];
}

@end
