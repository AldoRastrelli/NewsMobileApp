//
//  PostsViewModel.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import Foundation

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    func fetchPosts() {
        // TODO: Fetch posts from API
    }
}
