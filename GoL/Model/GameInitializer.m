//
//  GameInitializer.m
//  GoL
//
//  Created by Georg Meyer on 28.04.14.
//
//

#import "GameInitializer.h"
#import "Cell.h"
#import "NeighborhoodInitializer.h"

@interface GameInitializer()

@property (strong, nonatomic) NSArray *initialState;
@property (strong, nonatomic) NSMutableArray *field;
@property (strong, nonatomic) NeighborhoodInitializer *neighborhoodInitializer;

@property (nonatomic) NSUInteger width;
@property (nonatomic) NSUInteger height;

@end


@implementation GameInitializer

- (id) initWithInitialState:(NSArray *)initialState{
    self = [super init];
    if(self){
        self.initialState = initialState;
        self.height = initialState.count;
        self.width = [[initialState objectAtIndex:0] count];
        self.field = [[NSMutableArray alloc] initWithCapacity:self.height];
        
        self.neighborhoodInitializer = [[NeighborhoodInitializer alloc] initWithField:self.field andHeight:self.height andWidth:self.width];
    }
    return self;
}

- (NSArray *)initialize{
    
    return self.field;
}

- (void) setUpGame{
    for(NSArray *rowState in self.initialState){
        [self setUpRow:rowState];
    }
}


- (void) setUpRow:(NSArray *)rowState{
    NSMutableArray *row = [[NSMutableArray alloc] initWithCapacity:self.width];
    [self.field addObject:row];
    
    for(int i = 0; i < rowState.count; i++){
        BOOL isAlive = [[rowState objectAtIndex:i] boolValue];
        [self setUpCell:isAlive andColumn:i];
    }
}

- (void) setUpCell:(BOOL)isAlive andColumn:(NSInteger)index{
    Cell *cell = isAlive ? [Cell createAlive] : [Cell createDead];
    [self addCell:cell];
    
    [self.neighborhoodInitializer initializeCell:cell];
}

- (void) addCell:(Cell *)cell{
    [[self.field lastObject] addObject:cell];
}

@end
