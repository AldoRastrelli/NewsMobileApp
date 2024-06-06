//
//  FriendsViewTests.swift
//  NewsMobileAppTests
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import XCTest
@testable import NewsMobileApp

class FriendsViewControllerTests: XCTestCase {
    
    var sut: FriendsViewController!
    var viewModel: FriendsViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = FriendsViewModel()
        sut = FriendsViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_initialization() {
        XCTAssertNotNil(sut)
    }
    
    // More tests can be added if the class grows
}

