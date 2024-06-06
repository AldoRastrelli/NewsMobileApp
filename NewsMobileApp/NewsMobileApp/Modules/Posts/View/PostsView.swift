//
//  PostsView.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import UIKit
import Combine

final class PostsViewController: UIViewController {
    
    private let viewModel: PostsViewModel
    private var viewTitle = UILabel()
    private var searchBar = UISearchBar()
    private let tableView = UITableView()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        setupBindings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        // Add Title
        viewTitle.text = "My News"
        viewTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.addSubview(viewTitle)
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        viewTitle.anchor(top: safeArea.topAnchor, paddingTop: 10, leading: safeArea.leadingAnchor, paddingLeading: 24, trailing: safeArea.trailingAnchor, paddingTrailing: 24)
        
        // Add SearchBar
        searchBar.placeholder = "Search"
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.anchor(top: viewTitle.bottomAnchor, paddingTop: 10, leading: safeArea.leadingAnchor, paddingLeading: 24, trailing: safeArea.trailingAnchor, paddingTrailing: 24)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.anchor(top: searchBar.bottomAnchor, paddingTop: 10, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        // TODO: add cell
        // tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PostCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupBindings() {
        viewModel.$posts.sink { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }.store(in: &cancellables)
    }
}


extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        let post = viewModel.posts[indexPath.row]
        cell.textLabel?.text = post.title
        return cell
    }
}

extension PostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = viewModel.posts[indexPath.row]
        print(post)
    }
}
