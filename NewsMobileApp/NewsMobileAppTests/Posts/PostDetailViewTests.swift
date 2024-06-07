//
//  PostDetailViewTests.swift
//  NewsMobileAppTests
//
//  Created by Aldana Rastrelli on 07/06/2024.
//

import XCTest
@testable import NewsMobileApp

class PostDetailViewControllerTests: XCTestCase {
    
    var sut: PostDetailViewController!
    var viewModel: PostDetailViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let post = Post(id: 1, title: "title", content: "content", category: "category", publishedAt: "10/10/10 10:10:10")
        viewModel = PostDetailViewModel(post: post)
        sut = PostDetailViewController(viewModel: viewModel)
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

