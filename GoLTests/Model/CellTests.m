//
//  CellTests.m
//  GoL
//
//  Created by Georg Meyer on 27.04.14.
//
//

#import <XCTest/XCTest.h>
#import "Cell.h"

@interface CellTests : XCTestCase

@end

@interface CellTests()

@property (strong, nonatomic) Cell *cell;

@end

@implementation CellTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCellWithNoNeighborsDies
{
    Cell* cell = [Cell createAlive];
    [cell storeNextState];
    [cell applyNextState];
    XCTAssertFalse(cell.isAlive);
}

- (void)testCellWithOneNeighborsDies
{
    Cell* cell = [Cell createAlive];
    [cell addNeighborCell:Cell.createAlive];
    [cell storeNextState];
    [cell applyNextState];
    XCTAssertFalse(cell.isAlive);
}

- (void)testCellWithTwoNeighborsStaysAlive
{
    Cell* cell = [Cell createAlive];
    [cell addNeighborCell:Cell.createAlive];
    [cell addNeighborCell:Cell.createAlive];
    [cell storeNextState];
    [cell applyNextState];
    XCTAssertTrue(cell.isAlive);
}

- (void)testCellWithTwoNeighborsStaysDead
{
    Cell* cell = [Cell createDead];
    [cell addNeighborCell:Cell.createAlive];
    [cell addNeighborCell:Cell.createAlive];
    [cell storeNextState];
    [cell applyNextState];
    XCTAssertFalse(cell.isAlive);
}

- (void)testCellWithThreeNeighborsBecomesAlive
{
    Cell* cell = [Cell createDead];
    [cell addNeighborCell:Cell.createAlive];
    [cell addNeighborCell:Cell.createAlive];
    [cell addNeighborCell:Cell.createAlive];
    [cell storeNextState];
    [cell applyNextState];
    XCTAssertTrue(cell.isAlive);
}

- (void)testCellWithFourNeighborsDies
{
    Cell* cell = [Cell createAlive];
    [cell addNeighborCell:Cell.createAlive];
    [cell addNeighborCell:Cell.createAlive];
    [cell addNeighborCell:Cell.createAlive];
    [cell addNeighborCell:Cell.createAlive];
    [cell storeNextState];
    [cell applyNextState];
    XCTAssertFalse(cell.isAlive);
}

- (void)testCellWithFourNeighborsStaysDead
{
    Cell* cell = [Cell createDead];
    [cell addNeighborCell:Cell.createAlive];
    [cell addNeighborCell:Cell.createAlive];
    [cell addNeighborCell:Cell.createAlive];
    [cell addNeighborCell:Cell.createAlive];
    [cell storeNextState];
    [cell applyNextState];
    XCTAssertFalse(cell.isAlive);
}

@end
