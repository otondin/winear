//
//  WinearTests.swift
//  WinearTests
//
//  Created by Gabriel Tondin on 25/05/2021.
//

import XCTest
@testable import Winear

class WinearTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_GetTastings_Success() {
        let dataSource = TastingService()
        let expect = expectation(description: "getting tastings expectation")
        let result = dataSource.getTastings(20)
        switch result{
        case .success:
            XCTAssertTrue(true)
            expect.fulfill()
        case .failure:
            XCTAssertTrue(false)
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
