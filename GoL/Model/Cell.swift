//
//  Cell.swift
//  GoL
//
//  Created by Georg Meyer on 04.06.14.
//
//

import Foundation

extension Model {
    class Cell {
        
        var cellState : CellState
        var cellNeighborhood : CellNeighborhood
        var description : String {
            return isAlive() ? "o" : "_"
        }
        
        
        init(cellState : CellState){
            self.cellState = cellState
            self.cellNeighborhood = CellNeighborhood()
        }
        
        func isAlive() -> Bool {
            return cellState.isAlive()
        }
        
        func die() {
            cellState.die()
        }
        
        func revive() {
            cellState.revive()
        }
        
        func addNeighborCell(cell:Cell){
            cellNeighborhood.addCell(cell)
        }
        
        func storeNextState() {
            let currentState = cellState.isAlive()
            let nextState = cellNeighborhood.getNextState(currentState)
            cellState.storeNextState(nextState)
        }
        
        func applyNextState() {
            cellState.applyNextState()
        }
        
        class func createAlive() -> Cell {
            return Cell(cellState: CellState.createAlive())
        }
        
        class func createDead() -> Cell {
            return Cell(cellState: CellState.createDead())
        }
    }
}

