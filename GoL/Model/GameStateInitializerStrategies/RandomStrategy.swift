//
//  RandomStrategy.swift
//  GoL
//
//  Created by Marcel Meyer on 04.06.14.
//
//

import Foundation

// TODO: Fix nested namespace
extension GameStateInitializerStrategies {
    class RandomStrategy : GameStateInitializerStrategy {
        func getState() -> Bool {
            return arc4random_uniform(2) == 1
        }
    }
}

