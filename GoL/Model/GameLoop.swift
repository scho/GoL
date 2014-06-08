//
//  GameLoop.swift
//  GoL
//
//  Created by Georg Meyer on 08.06.14.
//
//

import Foundation


class GameLoop {
    var timeInterval : Double
    var game : Game
    var keepLooping : Bool
    var afterTick : () -> ()?
    
    init(game : Game, timeInterval : Double, afterTick : () -> ()){
        self.game = game
        self.timeInterval = timeInterval
        self.keepLooping = false
        self.afterTick = afterTick
        dispatchAsyncLoop()
    }
    
    func dispatchAsyncLoop() {
        let gameLoop = self
        
        let gameLoopQueue = dispatch_queue_create("Game Loop", nil)
        
        dispatch_async(gameLoopQueue, {
            while(true){
                if(gameLoop.keepLooping){
                    gameLoop.game.tick()
                    if(gameLoop.afterTick != nil){
                        gameLoop.afterTick()
                    }
                }
                
                NSThread.sleepForTimeInterval(gameLoop.timeInterval)
            }
        })
    }
    
    func start() {
        keepLooping = true
    }
    
    func stop() {
        keepLooping = false
    }
}