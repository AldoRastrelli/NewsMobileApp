//
//  User.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

struct User: Codable {
    let id: Int
    let firstname: String
    let lastname: String
    let email: String
    let login: Login
    let address: Address
    let phone: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstname
        case lastname
        case email
        case login
        case address
        case phone
    }
}

// MARK: - Address
struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo

    enum CodingKeys: String, CodingKey {
        case street
        case suite
        case city
        case zipcode
        case geo
    }
}

// MARK: - Geo
struct Geo: Codable {
    let lat: String
    let lng: String

    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }
}

// MARK: - Login
struct Login: Codable {
    let username: String
}

typealias Users = [User]
