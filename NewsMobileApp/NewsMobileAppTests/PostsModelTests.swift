//
//  PostsModelTests.swift
//  NewsMobileAppTests
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import XCTest
@testable import NewsMobileApp

class PostTests: XCTestCase {
    
    func testDecodePostFromValidJSON() throws {
        // Given
        let json = """
        {
            "id": 1,
            "title": "Test Title",
            "content": "Test Content",
            "thumbnail": "test_thumbnail.jpg",
            "category": "Test Category",
            "publishedAt": "2024-06-10"
        }
        """.data(using: .utf8)!
        
        // When
        let decoder = JSONDecoder()
        let post = try decoder.decode(Post.self, from: json)
        
        // Then
        XCTAssertEqual(post.id, 1)
        XCTAssertEqual(post.title, "Test Title")
        XCTAssertEqual(post.content, "Test Content")
        XCTAssertEqual(post.thumbnail, "test_thumbnail.jpg")
        XCTAssertEqual(post.category, "Test Category")
        XCTAssertEqual(post.publishedAt, "2024-06-10")
    }
    
    func testEncodePostToValidJSON() throws {
        // Given
        let post = Post(id: 1, title: "Test Title", content: "Test Content", thumbnail: "test_thumbnail.jpg", category: "Test Category", publishedAt: "2024-06-10")
        
        // When
        let encoder = JSONEncoder()
        let json = try encoder.encode(post)
        let decodedPost = try JSONDecoder().decode(Post.self, from: json)
        
        // Then
        XCTAssertTrue(postsAreEqual(post, decodedPost))
    }
    
    // This func is used to compare two arrays of posts without implementing "Equatable" in the Post model
    private func postsAreEqual(_ post1: Post, _ post2: Post) -> Bool {
        return post1.id == post2.id &&
            post1.title == post2.title &&
            post1.content == post2.content &&
            post1.thumbnail == post2.thumbnail &&
            post1.category == post2.category &&
            post1.publishedAt == post2.publishedAt
    }
}
