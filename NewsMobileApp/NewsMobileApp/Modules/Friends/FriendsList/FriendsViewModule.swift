//
//  FriendsViewModule.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import UIKit

final class FriendsViewModule {
    static func build() -> UIViewController {
        return FriendsViewController(viewModel: FriendsViewModel())
    }
}
