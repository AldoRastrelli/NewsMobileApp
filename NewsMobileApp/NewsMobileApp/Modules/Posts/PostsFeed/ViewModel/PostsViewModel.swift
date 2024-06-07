//
//  PostsViewModel.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import Foundation
import Combine

final class PostsViewModel {
    @Published var posts: Posts = [] { didSet { filteredPosts = posts } }
    @Published private(set) var filteredPosts: Posts = []
    @Published var searchText: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private var postsService: PostsService = PostsService()
    
    init() {
        setupBindings()
        fetchPosts()
    }
    
    private func setupBindings() {
        $searchText.sink { [weak self] _ in
            DispatchQueue.main.async {
                self?.searchPosts()
            }
        }.store(in: &cancellables)
    }
    
    private func searchPosts() {
        $searchText
                .debounce(for: .milliseconds(150), scheduler: RunLoop.main)
                .combineLatest($posts)
                .map { [weak self] searchText, posts in
                    guard let self = self else { return posts }
                    let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                    guard !trimmedSearchText.isEmpty else { return posts }
                    return self.posts.filter {
                        $0.title.trimmingCharacters(in: .whitespacesAndNewlines).lowercased().contains(trimmedSearchText) ||
                        $0.content.trimmingCharacters(in: .whitespacesAndNewlines).lowercased().contains(trimmedSearchText)
                    }
                }
                .assign(to: &$filteredPosts)
    }
    
    private func fetchPosts() {
        Task {
            do {
                posts = try await postsService.getPosts()
            } catch {
                print("Error fetching posts: \(error)")
            }
        }
    }
    
    public func refreshData() {
        fetchPosts()
    }
}
