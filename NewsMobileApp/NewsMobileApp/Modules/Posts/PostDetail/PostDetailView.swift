//
//  PostDetailView.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

//
//  PostDetailView.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import UIKit

final class PostDetailView: UIViewController {

    private let post: Post
    private let titleLabel: UILabel = UILabel()
    private let subtitleLabel: UILabel = UILabel()
    private let contentLabel: UILabel = UILabel()
    private let publishedAtLabel: UILabel = UILabel()
    private let scrollView: UIScrollView = UIScrollView()
    private let contentView: UIView = UIView()

    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor)

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.anchor(
            top: scrollView.topAnchor,
            leading: scrollView.leadingAnchor,
            trailing: scrollView.trailingAnchor,
            bottom: scrollView.bottomAnchor)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])


        [titleLabel, subtitleLabel, contentLabel, publishedAtLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.anchor(
            top: contentView.topAnchor, paddingTop: 16,
            leading: contentView.leadingAnchor, paddingLeading: 16,
            trailing: contentView.trailingAnchor, paddingTrailing: 16)

        subtitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        subtitleLabel.anchor(
            top: titleLabel.bottomAnchor, paddingTop: 8,
            leading: contentView.leadingAnchor, paddingLeading: 16,
            trailing: contentView.trailingAnchor, paddingTrailing: 16)

        contentLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        contentLabel.numberOfLines = 0
        contentLabel.anchor(
            top: subtitleLabel.bottomAnchor, paddingTop: 16,
            leading: contentView.leadingAnchor, paddingLeading: 16,
            trailing: contentView.trailingAnchor, paddingTrailing: 16)

        publishedAtLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        publishedAtLabel.textAlignment = .center
        publishedAtLabel.numberOfLines = 0
        publishedAtLabel.anchor(
            top: contentLabel.bottomAnchor, paddingTop: 16,
            leading: contentView.leadingAnchor, paddingLeading: 16,
            trailing: contentView.trailingAnchor, paddingTrailing: 16,
            bottom: contentView.bottomAnchor, paddingBottom: 16)
    }

    private func configureUI() {
        titleLabel.text = post.title
        subtitleLabel.text = post.category
        contentLabel.text = post.content
        publishedAtLabel.text = post.publishedAt
    }
}
