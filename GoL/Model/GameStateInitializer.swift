//
//  GameStateInitializer.swift
//  GoL
//
//  Created by Georg Meyer on 08.06.14.
//
//

import Foundation

class GameStateInitializer {
    
    var gameState : Array<Array<Bool>>
    var dimensions : Dimensions
    var gameStateInitializerStrategy : GameStateInitializerStrategy
    
    init(dimensions : Dimensions, gameStateInitializerStrategy : GameStateInitializerStrategy){
        self.gameState = Array()
        self.dimensions = dimensions
        self.gameStateInitializerStrategy = gameStateInitializerStrategy
    }
    
    func generateGameState() -> Array<Array<Bool>>{
        addRows()
        
        return gameState
    }
    
    func addRows() {
        for i in 1...self.dimensions.height {
            addRow()
        }
    }
    
    func addRow(){
        var rowArray = Bool[]();
        for i in 1...self.dimensions.width {
            rowArray.append(cellState())
        }
        gameState.append(rowArray);
    }
    
    func cellState() -> Bool {
        return gameStateInitializerStrategy.getState()
    }
}