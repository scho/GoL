//
//  CellState.swift
//  GoL
//
//  Created by Georg Meyer on 04.06.14.
//
//

import Foundation

class CellState {
    var currentState = false
    var nextState = false
    
    init(currentState : Bool){
        self.currentState = currentState
    }
    
    func isAlive() -> Bool {
        return currentState
    }
    
    func applyNextState(){
        currentState = nextState
    }
    
    func storeNextState(nextState : Bool){
        self.nextState = nextState
    }
    
    func die(){
        currentState = false
    }
    
    func revive(){
        currentState = true
    }
    
    class func createAlive() -> CellState{
        return CellState(currentState: true)
    }
    
    class func createDead() -> CellState{
        return CellState(currentState: false)
    }
}