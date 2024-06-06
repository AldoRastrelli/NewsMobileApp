//
//  PostsViewModel.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import Foundation

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        // TODO: Fetch posts from API
        posts = [Post(id: 1, slug: "hola", url: "url", title: "This is the title", content: "This is a content, and is longer", image: "imageurl", thumbnail: "thumbnail", status: "this is a status", category: "category here", publishedAt: "published at??", updatedAt: "updated date!!", userID: 1), Post(id: 2, slug: "hola", url: "url", title: "This is the title", content: "This is a content, and is longer", image: "imageurl", thumbnail: "thumbnail", status: "this is a status", category: "category here", publishedAt: "published at??", updatedAt: "updated date!!", userID: 2)]
    }
}
