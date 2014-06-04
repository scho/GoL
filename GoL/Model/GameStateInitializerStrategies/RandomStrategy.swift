//
//  RandomStrategy.swift
//  GoL
//
//  Created by chico on 04.06.14.
//
//

import Foundation

class RandomStrategy : GameStateInitializerStrategy {
    func getState() -> Bool {
        return arc4random_uniform(2) == 1;
    }
}