//
//  PostsFeedModule.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import UIKit

final class PostsFeedModule {
    static func build() -> UIViewController {
        return PostsViewController(viewModel: PostsViewModel())
    }
}
