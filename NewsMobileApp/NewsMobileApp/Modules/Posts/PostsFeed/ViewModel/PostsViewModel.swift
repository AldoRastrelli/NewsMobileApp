//
//  PostsViewModel.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import Foundation

class PostsViewModel: SearchViewDataProvider {
    @Published var items: [SearchViewData] = []
    @Published var searchText: String = ""
    
    // To keep track of the changes
    var itemsPublisher: Published<[SearchViewData]>.Publisher { $items }
    var searchTextPublisher: Published<String>.Publisher { $searchText }
    
    public var posts: [Post] = [] {
        didSet {
            items = posts
        }
    }
    
    init() {
        fetchPosts()
    }
    
    private func fetchPosts() {
        // TODO: Fetch posts from API
        posts = [Post(id: 1, slug: "hola", url: "url", title: "This is the title", content: "This is a content, and is longer", image: "imageurl", thumbnail: "thumbnail", status: "this is a status", category: "category here", publishedAt: "published at??", updatedAt: "updated date!!", userID: 1), Post(id: 2, slug: "hola", url: "url", title: "This is the title", content: "This is a content, and is longer", image: "imageurl", thumbnail: "thumbnail", status: "this is a status", category: "category here", publishedAt: "published at??", updatedAt: "updated date!!", userID: 2)]
    }
    
    func getTitle() -> String {
        return "My News"
    }
}
