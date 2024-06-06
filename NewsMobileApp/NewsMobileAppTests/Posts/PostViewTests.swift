//
//  PostsViewTests.swift
//  NewsMobileAppTests
//
//  Created by Aldana Rastrelli on 05/06/2024.
//

import XCTest
@testable import NewsMobileApp

class PostsViewControllerTests: XCTestCase {
    
    var sut: PostsViewController!
    var viewModel: PostsViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = PostsViewModel()
        sut = PostsViewController(viewModel: viewModel)
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
