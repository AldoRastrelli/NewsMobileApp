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
    private var headerView: HeaderView?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.headerView = HeaderView(superView: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        setupBindings()
        setupKeyboard()
    }
    
    func setupKeyboard() {
        guard let header = headerView else { return }
        // Add tap gesture for hiding keyboard
        let tapGesture = UITapGestureRecognizer(target: header, action: #selector(header.handleTap(_:)))
        header.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        let safeArea = view.safeAreaLayoutGuide
        
        guard let header = headerView else { return }
        // Add header view: this will enable the gesture recognizer for closing the keyboard
        view.addSubview(header)
        
        // Add Title
        viewTitle.text = "My News"
        viewTitle.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        view.addSubview(viewTitle)
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        
        viewTitle.anchor(top: safeArea.topAnchor, paddingTop: 24, leading: safeArea.leadingAnchor, paddingLeading: 24, trailing: safeArea.trailingAnchor, paddingTrailing: 24)
        
        // Add SearchBar
        searchBar.placeholder = "Search"
        view.addSubview(searchBar)
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.anchor(top: viewTitle.bottomAnchor, paddingTop: 30, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor)
        searchBar.searchTextField.anchor(leading: viewTitle.leadingAnchor, trailing: viewTitle.trailingAnchor)
        searchBar.searchBarStyle = .minimal
        
        // Set header constraints to be above the searchbar
        header.anchor(top: safeArea.topAnchor, paddingTop: 0, leading: safeArea.leadingAnchor, paddingLeading: 0, trailing: safeArea.trailingAnchor, paddingTrailing: 0, bottom: searchBar.topAnchor)
        header.backgroundColor = .none
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.anchor(top: searchBar.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor)
        tableView.register(GenericCell.self, forCellReuseIdentifier: GenericCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupBindings() {
        viewModel.$filteredPosts.sink { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }.store(in: &cancellables)
    }
}

extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GenericCell.identifier, for: indexPath) as? GenericCell else {
            // This should never happen
            preconditionFailure("Could not dequeue cell with identifier: \(GenericCell.identifier)")
        }
        let post = viewModel.filteredPosts[indexPath.row]
        cell.configure(title: post.title, subtitle: post.content, disclaimer: post.publishedAt)
        return cell
    }
}

extension PostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = viewModel.filteredPosts[indexPath.row]
        let vc = PostDetailModule.build(forPost: post)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension PostsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
    }
}
