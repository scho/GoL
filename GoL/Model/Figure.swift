//
//  Figure.swift
//  GoL
//
//  Created by Georg Meyer on 03.06.14.
//
//

import Foundation

extension Model {
    class Figure {
        var dimensions : Dimensions
        var field : Bool[][]
        
        init(dimensions : Dimensions){
            self.field = []
            self.dimensions = dimensions
        }
        
        func addLine(line : String) {
            var row : Bool[] = []
            
            let o : Character = "o"
            for char in line {
                row.append(o == char)
            }
            
            field.append(row)
        }
        
        class func createLightweightSpaceship() -> Figure {
            let dimensions = Dimensions(width: 5, height: 4)
            let figure = Figure(dimensions: dimensions)
            
            figure.addLine("o__o_")
            figure.addLine("____o")
            figure.addLine("o___o")
            figure.addLine("_oooo")
            
            return figure
        }
    }
}