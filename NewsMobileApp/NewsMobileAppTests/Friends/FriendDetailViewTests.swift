//
//  FriendDetailViewTests.swift
//  NewsMobileAppTests
//
//  Created by Aldana Rastrelli on 07/06/2024.
//

import XCTest
@testable import NewsMobileApp

class FriendDetailViewControllerTests: XCTestCase {
    
    var sut: FriendDetailViewController!
    var viewModel: FriendDetailViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let user = User(id: 1, firstname: "John", lastname: "Doe", email: "email@example.com", login: Login(username: "johndoe"), address: Address(street: "123 Main Street", suite: "Apt. 4", city: "Anytown", zipcode: "12345-6789", geo: Geo(lat: "42.1234", lng: "-71.2345")), phone: "(555) 555-1234")
        viewModel = FriendDetailViewModel(user: user)
        sut = FriendDetailViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_initialization() {
        XCTAssertNotNil(sut)
    }
    
    // More tests can be added if the class grows
}

