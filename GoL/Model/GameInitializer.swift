//
//  GameInitializer.swift
//  GoL
//
//  Created by Georg Meyer on 08.06.14.
//
//

import Foundation


class GameInitializer {
    
    var initialState : Array<Array<Bool>>
    var field : Array<Array<Cell>>
    var neighborhoodInitializer : NeighborhoodInitializer
    var dimensions : Dimensions
    
    init(initialState : Array<Array<Bool>>, dimensions : Dimensions){
        self.initialState = initialState
        self.dimensions = dimensions
        self.field = Array<Array<Cell>>()
        self.neighborhoodInitializer = NeighborhoodInitializer(dimensions: dimensions)
        
    }
    
    func initialize() -> Array<Array<Cell>> {
        setUpGame()
        
        return field
    }
    
    func setUpGame() {
        for rowState in initialState {
            setUpRow(rowState)
        }
    }
    
    func setUpRow(rowState : Array<Bool>){
        var row : Array<Cell> = Array<Cell>()
        
        field.append(row)

        for isAlive in rowState {
            setUpCell(isAlive)
        }
    }
    
    func setUpCell(isAlive : Bool){
        let cell = isAlive ? Cell.createAlive() : Cell.createDead()
        addCell(cell)
        neighborhoodInitializer.initializeCell(cell, field: field)
    }
    
    func addCell(cell : Cell){
        self.field[self.field.count - 1].append(cell)
    }
}