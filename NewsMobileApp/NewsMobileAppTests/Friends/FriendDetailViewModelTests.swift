//
//  FriendDetailViewModelTests.swift
//  NewsMobileAppTests
//
//  Created by Aldana Rastrelli on 07/06/2024.
//

import XCTest
@testable import NewsMobileApp

class FriendDetailViewModelTests: XCTestCase {
    
    let user = User(id: 1, firstname: "John", lastname: "Doe", email: "email@example.com", login: Login(username: "johndoe"), address: Address(street: "123 Main Street", suite: "Apt. 4", city: "Anytown", zipcode: "12345-6789", geo: Geo(lat: "42.1234", lng: "-71.2345")), phone: "(555) 555-1234")
    var viewModel: FriendDetailViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = FriendDetailViewModel(user: user)
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
        
        XCTAssertTrue(usersAreEqual(viewModel.user, user))
    }
    
    // More tests can be added if the class grows
    
    /// This func is used to compare two arrays of posts without implementing "Equatable" in the Post model
    private func usersAreEqual(_ user1: User, _ user2: User) -> Bool {
        return user1.id == user2.id &&
            user1.firstname == user2.firstname &&
            user1.lastname == user2.lastname &&
            user1.email == user2.email &&
            user1.login.username == user2.login.username &&
            user1.address.street == user2.address.street &&
            user1.address.suite == user2.address.suite &&
            user1.address.city == user2.address.city &&
            user1.address.zipcode == user2.address.zipcode &&
            user1.address.geo.lat == user2.address.geo.lat &&
            user1.address.geo.lng == user2.address.geo.lng &&
            user1.phone == user2.phone
    }
}

