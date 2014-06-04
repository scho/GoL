//
//  CellNeighborhood.swift
//  GoL
//
//  Created by Georg Meyer on 04.06.14.
//
//

import Foundation

class CellNeighborhood {
    
    var _cells : Cell[];
    
    init(){
        _cells = Cell[]();
    }
    
    func addCell(cell: Cell){
        _cells.append(cell);
        if(_cells.count > 8){
            println("WARNING - Adding more than eight neighbors");
        }
    }
    
    func getNextState(currentState : Bool) -> Bool{
        if(stateCanChange()){
            return countAlive() == 3;
        }
        return currentState;
    }
    
    func stateCanChange() -> Bool {
        return countAlive() != 2;
    }
    
    func countAlive() -> Int {
        var count = 0;
        
        for cell in _cells {
            if(cell.isAlive()){
                count++;
            }
        }
        
        return count;
    }
    
}