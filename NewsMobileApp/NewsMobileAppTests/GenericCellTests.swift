//
//  GenericCellTests.swift
//  NewsMobileAppTests
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import XCTest
@testable import NewsMobileApp

class GenericCellTests: XCTestCase {

    var cell: GenericCell!

    override func setUp() {
        super.setUp()
        cell = GenericCell(style: .default, reuseIdentifier: "TestCell")
    }

    override func tearDown() {
        cell = nil
        super.tearDown()
    }

    func testInit() {
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell.contentView.subviews.count, 3)
    }
}

