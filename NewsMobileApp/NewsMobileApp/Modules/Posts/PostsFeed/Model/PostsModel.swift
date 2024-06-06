//
//  NewsModel.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

struct Post: Codable {
    let id: Int
    let title: String
    let content: String
    let thumbnail: String
    let category: String
    let publishedAt: String

    enum CodingKeys: String, CodingKey {
        case id, title, content, thumbnail, category, publishedAt
    }
}

typealias Posts = [Post]
