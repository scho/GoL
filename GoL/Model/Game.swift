//
//  Game.swift
//  GoL
//
//  Created by Georg Meyer on 08.06.14.
//
//

import Foundation

class Game {
    
    var dimensions : Dimensions
    var field : Array<Array<Cell>>
    var gameStateInitializer : GameStateInitializer
    var description : String{
        var result = ""
        
        for row in field {
            for cell in row {
                result += cell.description
            }
            result += "\n"
        }
            
        return result
    }
    
    
    init(dimensions : Dimensions, gameStateInitializer : GameStateInitializer){
        self.dimensions = dimensions
        self.gameStateInitializer = gameStateInitializer
        self.field = GameInitializer(initialState: gameStateInitializer.generateGameState(), dimensions: dimensions).initialize()
    }
    
    func tick() {
        for row in field {
            for cell in row {
                cell.storeNextState()
            }
        }
        for row in field {
            for cell in row {
                cell.applyNextState()
            }
        }
    }
    
    func addFigure(figure : Figure){
        
    }
    
    
}