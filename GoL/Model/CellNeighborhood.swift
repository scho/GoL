//
//  CellNeighborhood.swift
//  GoL
//
//  Created by Georg Meyer on 04.06.14.
//
//

import Foundation

class CellNeighborhood {
    
    var cells : Cell[]
    
    init(){
        cells = Cell[]()
    }
    
    func addCell(cell: Cell){
        cells.append(cell)
        if(cells.count > 8){
            println("WARNING - Adding more than eight neighbors")
        }
    }
    
    func getNextState(currentState : Bool) -> Bool{
        if(stateCanChange()){
            return countAlive() == 3
        }
        return currentState
    }
    
    func stateCanChange() -> Bool {
        return countAlive() != 2
    }
    
    func countAlive() -> Int {
        var count = 0
        
        for cell in cells {
            if(cell.isAlive()){
                count++
            }
        }
        
        return count
    }
    
}