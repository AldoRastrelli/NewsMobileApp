//
//  FriendsDetailModule.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 07/06/2024.
//

import UIKit

final class FriendsDetailModule {
    static func build(forUser user: User) -> UIViewController {
        let viewModel = FriendDetailViewModel(user: user)
        return FriendDetailViewController(viewModel: viewModel)
    }
}
