//
//  PostsModule.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import UIKit

final class PostsModule {
    static func build() -> UIViewController {
        return SearchViewController(viewModel: PostsViewModel())
    }
}
