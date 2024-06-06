//
//  PostsService.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import Foundation

final class PostsService {
    func getPosts() async throws -> [Post] {
        let url = URL(string: "https://jsonplaceholder.org/posts")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Post].self, from: data)
    }
}
