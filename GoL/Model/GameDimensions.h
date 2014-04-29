//
//  GameDimensions.h
//  GoL
//
//  Created by Georg Meyer on 29.04.14.
//
//

#import <Foundation/Foundation.h>

@interface GameDimensions : NSObject

@property (nonatomic) NSInteger width;
@property (nonatomic) NSInteger height;

- (id) initWithHeight:(NSInteger)height andWidth:(NSInteger)width;

@end
