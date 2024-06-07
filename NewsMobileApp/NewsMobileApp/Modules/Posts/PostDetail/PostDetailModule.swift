//
//  PostDetailModule.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 07/06/2024.
//

import UIKit

final class PostDetailModule {
    static func build(forPost post: Post) -> UIViewController {
        let viewModel = PostDetailViewModel(post: post)
        return PostDetailViewController(viewModel: viewModel)
    }
}
