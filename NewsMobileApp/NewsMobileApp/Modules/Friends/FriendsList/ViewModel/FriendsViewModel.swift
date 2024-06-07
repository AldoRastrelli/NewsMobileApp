//
//  FriendsViewModel.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import Foundation

import Foundation
import Combine

final class FriendsViewModel {
    @Published var users: [User] = []
    private var usersService: FriendsService = FriendsService()
    
    init() {
        fetchusers()
    }
    
    private func fetchusers() {
        Task {
            do {
                users = try await usersService.getUsers().sorted { $0.login.username < $1.login.username }
                
            } catch {
                print("Error fetching users: \(error)")
            }
        }
    }
}
