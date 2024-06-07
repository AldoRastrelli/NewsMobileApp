//
//  FriendsView.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import UIKit
import Combine

final class FriendsViewController: UIViewController {
    
    private let viewModel: FriendsViewModel
    private var viewTitle = UILabel()
    private let tableView = UITableView()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: FriendsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        let safeArea = view.safeAreaLayoutGuide
        
        // Add Title
        viewTitle.text = "My Friends"
        viewTitle.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        view.addSubview(viewTitle)
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        
        viewTitle.anchor(top: safeArea.topAnchor, paddingTop: 24, leading: safeArea.leadingAnchor, paddingLeading: 24, trailing: safeArea.trailingAnchor, paddingTrailing: 24)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.anchor(top: viewTitle.bottomAnchor, paddingTop: 15, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor)
        tableView.register(GenericCell.self, forCellReuseIdentifier: GenericCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}


extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GenericCell.identifier, for: indexPath) as? GenericCell else {
            // This should never happen
            preconditionFailure("Could not dequeue cell with identifier: \(GenericCell.identifier)")
        }
        let user = viewModel.users[indexPath.row]
        cell.configure(title: "@\(user.login.username)", subtitle: "\(user.firstname) \(user.lastname)", disclaimer: nil)
        return cell
    }
}

extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.users[indexPath.row]
        let vc = FriendsDetailModule.build(forUser: user)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
