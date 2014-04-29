//
//  NeighborhoodInitializer.m
//  GoL
//
//  Created by Georg Meyer on 28.04.14.
//
//

#import "NeighborhoodInitializer.h"
#import "Cell.h"
#import "GameDimensions.h"

@interface NeighborhoodInitializer()

@property (strong, nonatomic) NSMutableArray *field;
@property (strong, nonatomic) Cell *lastAddedCell;

@property (strong, nonatomic) GameDimensions *gameDimensions;


@end

@implementation NeighborhoodInitializer

- (id) initWithField:(NSMutableArray *)field andGameDimensions:(GameDimensions *)gameDimensions{
    self = [super init];
    if(self){
        self.field = field;
        self.gameDimensions = gameDimensions;
    }
    return self;
}

- (void) initializeCell:(Cell *)cell{
    self.lastAddedCell = cell;
    
    [self setNeighborhoodForCurrentRow];
    [self setNeighborhoodForPreviousRow];
}

- (void) setNeighborhoodForCurrentRow{
    if([self.field count] <= 1){
        return;
    }
    
    NSMutableArray *currentRow = [self.field lastObject];
    
    [self setNeighborhoodForRow:currentRow andIndex:[currentRow count] - 2];
    
    if([currentRow count] == self.gameDimensions.width){
        [self setNeighborhoodForRow:currentRow andIndex:0];
    }
}

- (void) setNeighborhoodForPreviousRow{
    if([self.field count] <= 1){
        return;
    }
    
    NSMutableArray *previousRow = [self.field objectAtIndex:[self.field count] - 1];
    NSInteger currentIndex = [[self.field lastObject] count] - 1;
    
    
    [self setNeighborhoodForRow:previousRow andIndex:currentIndex - 1];
    [self setNeighborhoodForRow:previousRow andIndex:currentIndex];
    [self setNeighborhoodForRow:previousRow andIndex:currentIndex + 1];
    
    if([self.field count] == self.gameDimensions.height){
        NSMutableArray *firstRow = [self.field objectAtIndex:0];
        
        [self setNeighborhoodForRow:firstRow andIndex:currentIndex - 1];
        [self setNeighborhoodForRow:firstRow andIndex:currentIndex];
        [self setNeighborhoodForRow:firstRow andIndex:currentIndex + 1];
    }
}

- (void) setNeighborhoodForRow:(NSArray *)row andIndex:(NSInteger)index{
    if([row count] > index && index >= 0){
        [self setNeighborhood:[row objectAtIndex:index]];
    }
}


- (void) setNeighborhood:(Cell *)neighborCell{
    [self.lastAddedCell addNeighborCell:neighborCell];
    [neighborCell addNeighborCell:self.lastAddedCell];
}

@end
