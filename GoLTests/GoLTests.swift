//
//  GoLTests.swift
//  GoLTests
//
//  Created by Georg Meyer on 09.06.14.
//  Copyright (c) 2014 SchoMa Entertainment. All rights reserved.
//

import XCTest
import GoL

class GoLTests: XCTestCase {
    
    func testCellWithNoNeighborsDie() {
        var cell = Model.Cell.createAlive();
        cell.storeNextState();
        cell.applyNextState();
        XCTAssertFalse(cell.isAlive());
    }

    
    func testCellWithOneNeighborsDies(){
        let cell = Model.Cell.createAlive()
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.storeNextState();
        cell.applyNextState();
        XCTAssertFalse(cell.isAlive());
    }
    
    func testCellWithTwoNeighborsStaysAlive(){
        let cell = Model.Cell.createAlive()
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.storeNextState();
        cell.applyNextState();
        XCTAssertTrue(cell.isAlive());
    }
    
    func testCellWithTwoNeighborsStaysDead(){
        let cell = Model.Cell.createDead()
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.storeNextState();
        cell.applyNextState();
        XCTAssertFalse(cell.isAlive());
    }
    
    func testCellWithThreeNeighborsBecomesAlive(){
        let cell = Model.Cell.createDead()
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.storeNextState();
        cell.applyNextState();
        XCTAssertTrue(cell.isAlive());
    }
    
    func testCellWithFourNeighborsDies(){
        var cell = Model.Cell.createAlive()
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.storeNextState();
        cell.applyNextState();
        XCTAssertFalse(cell.isAlive());
    }
    
    func testCellWithFourNeighborsStaysDead(){
        var cell = Model.Cell.createDead()
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.addNeighborCell(Model.Cell.createAlive());
        cell.storeNextState();
        cell.applyNextState();
        XCTAssertFalse(cell.isAlive());
    }
    
}
