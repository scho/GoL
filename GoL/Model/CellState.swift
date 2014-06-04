//
//  CellState.swift
//  GoL
//
//  Created by Georg Meyer on 04.06.14.
//
//

import Foundation

class CellState {
    var _currentState = false;
    var _nextState = false;
    
    init(currentState : Bool){
        _currentState = currentState;
    }
    
    func isAlive() -> Bool {
        return _currentState;
    }
    
    func applyNextState(){
        _currentState = _nextState;
    }
    
    func storeNextState(nextState : Bool){
        _nextState = nextState;
    }
    
    func die(){
        _currentState = false;
    }
    
    func revive(){
        _currentState = true;
    }
    
    class func createAlive() -> CellState{
        return CellState(currentState: true);
    }
    
    class func createDead() -> CellState{
        return CellState(currentState: false);
    }
}