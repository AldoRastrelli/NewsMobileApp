//
//  FriendsService.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import Foundation

final class FriendsService {
    func getUsers() async throws -> [User] {
        let url = URL(string: "https://jsonplaceholder.org/users")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Users.self, from: data)
    }
}
