//
//  PostDetailModelTests.swift
//  NewsMobileAppTests
//
//  Created by Aldana Rastrelli on 07/06/2024.
//

import XCTest
@testable import NewsMobileApp

class PostDetailViewModelTests: XCTestCase {
    
    let post = Post(id: 1, title: "title", content: "content", category: "category", publishedAt: "10/10/10 10:10:10")
    var viewModel: PostDetailViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = PostDetailViewModel(post: post)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        try super.tearDownWithError()
    }
    
    func test_initialization() {
        XCTAssertNotNil(viewModel)
    }
    
    func test_initialization_postIsStoredCorrectly() {
        // given sut
        
        // when created
        
        XCTAssertTrue(postsAreEqual(viewModel.post, post))
    }
    
    // More tests can be added if the class grows
    
    /// This func is used to compare two arrays of posts without implementing "Equatable" in the Post model
    private func postsAreEqual(_ post1: Post, _ post2: Post) -> Bool {
        return post1.id == post2.id &&
            post1.title == post2.title &&
            post1.content == post2.content &&
            post1.category == post2.category &&
            post1.publishedAt == post2.publishedAt
    }
}

