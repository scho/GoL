//
//  AllDeadStrategy.swift
//  GoL
//
//  Created by Marcel Meyer on 04.06.14.
//
//

import Foundation

// TODO: Fix nested namespace
extension GameStateInitializerStrategies {
    class AllDeadStrategy : GameStateInitializerStrategy {
        func getState() -> Bool {
            return false
        }
    }
}