//
//  WinearDataSourceTests.swift
//  WinearDataSourceTests
//
//  Created by Gabriel Tondin on 15/06/2021.
//

import XCTest
@testable import WinearDataSource

class WinearDataSourceTests: XCTestCase {
    
    func test_GetTastings_Success() {
        let dataSource = TastingService()
        let expect = expectation(description: "getting tastings work")
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
