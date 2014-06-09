//
//  NeighborhoodInitializer.swift
//  GoL
//
//  Created by Georg Meyer on 08.06.14.
//
//

import Foundation

extension Model {
    class NeighborhoodInitializer {
        
        var dimensions : Dimensions
        var field : Array<Array<Cell>>!
        var lastAddedCell : Cell!
        
        init(dimensions : Dimensions){
            self.dimensions = dimensions
        }
        
        func initializeCell(cell : Cell, field : Array<Array<Cell>>){
            self.lastAddedCell = cell
            self.field = field
            self.setNeighborhoodForCurrentRow()
            self.setNeighborhoodForPreviousRow()
        }
        
        func setNeighborhoodForCurrentRow() {
            let currentRow = field[field.count - 1]
            let count : Int = currentRow.count
            
            if(count == 1){
                return
            }
            
            setNeighborhoodForRow(currentRow, index: count - 2)
            
            if(count == dimensions.width){
                setNeighborhoodForRow(currentRow, index: 0)
            }
        }
        
        func setNeighborhoodForPreviousRow(){
            if (field.count <= 1) {
                return
            }
            
            let previousRow = field[field.count - 2]
            let currentIndex = field[field.count - 1].count - 1
            
            setNeighborhoodForRow(previousRow, index: currentIndex - 1)
            setNeighborhoodForRow(previousRow, index: currentIndex)
            setNeighborhoodForRow(previousRow, index: currentIndex + 1)
            
            
            if (field.count == dimensions.height) {
                let firstRow = field[0]
                
                setNeighborhoodForRow(firstRow, index: currentIndex - 1)
                setNeighborhoodForRow(firstRow, index: currentIndex)
                setNeighborhoodForRow(firstRow, index: currentIndex + 1)
            }
        }
        
        func setNeighborhoodForRow(row : Array<Cell>, index : Int){
            var i = index
            
            if(i < 0){
                i += row.count
            }
            
            if(i >= row.count){
                i -= row.count
            }
            
            setNeighborhood(row[i])
        }
        
        func setNeighborhood(cell : Cell) {
            self.lastAddedCell.addNeighborCell(cell)
            cell.addNeighborCell(lastAddedCell)
        }
    }
}