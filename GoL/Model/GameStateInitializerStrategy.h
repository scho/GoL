//
//  GameStateInitializerStrategy.h
//  GoL
//
//  Created by Georg Meyer on 01.06.14.
//
//

#import <Foundation/Foundation.h>

@protocol GameStateInitializerStrategy <NSObject>

- (BOOL)getState;

@end
