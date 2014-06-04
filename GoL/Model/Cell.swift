//
//  Cell.swift
//  GoL
//
//  Created by Georg Meyer on 04.06.14.
//
//

import Foundation

class Cell {

    var _cellState : CellState;
    var _cellNeighborhood : CellNeighborhood;
    
    init(cellState : CellState){
        _cellState = cellState;
        _cellNeighborhood = CellNeighborhood();
    }
    
    func description() -> String {
        return isAlive() ? "o" : "_";
    }
    
    func isAlive() -> Bool {
        return _cellState.isAlive();
    }
    
    func die() {
        _cellState.die();
    }
    
    func revive() {
        _cellState.revive();
    }
    
    func addNeighborCell(cell:Cell){
        _cellNeighborhood.addCell(cell);
    }
    
    func storeNextState() {
        let currentState = _cellState.isAlive();
        let nextState = _cellNeighborhood.getNextState(currentState);
        _cellState.storeNextState(nextState);
    }
    
    func applyNextState() {
        _cellState.applyNextState();
    }
    
    class func createAlive() -> Cell {
        return Cell(cellState: CellState.createAlive());
    }
    
    class func createDead() -> Cell {
        return Cell(cellState: CellState.createDead());
    }
}