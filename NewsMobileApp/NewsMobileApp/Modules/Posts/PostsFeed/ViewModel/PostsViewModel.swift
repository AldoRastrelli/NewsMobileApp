//
//  PostsViewModel.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import Foundation
import Combine

class PostsViewModel: SearchViewDataProvider {
//    @Published private(set) var filteredItems: [SearchViewData] = []
    private var posts: [Post] = [] { didSet { items = posts } }
    private var cancellables = Set<AnyCancellable>()
    
    // SearchViewDataProvider protocol
    @Published var items: [SearchViewData] = [] // { didSet { filteredItems = items } }
    @Published var searchText: String = ""
    var itemsPublisher: Published<[SearchViewData]>.Publisher { $items } // { $filteredItems }
    var searchTextPublisher: Published<String>.Publisher { $searchText }
    
    init() {
        setBindings()
        fetchPosts()
    }
    
    private func setBindings() {
        $searchText.sink { [weak self] _ in
            DispatchQueue.main.async {
                self?.searchPosts()
            }
        }.store(in: &cancellables)
    }
    
    private func searchPosts() {
//        $searchText
//                .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
//                .combineLatest($items)
//                .map { [weak self] searchText, items in
//                    guard let self = self else { return items }
//                    let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
//                    guard !trimmedSearchText.isEmpty else { return items }
//                    return self.posts.filter {
//                        $0.title.lowercased().contains(trimmedSearchText) ||
//                        $0.subtitle.lowercased().contains(trimmedSearchText)
//                    }
//                }
//                .assign(to: &$filteredItems)
    }
    
    private func fetchPosts() {
        // TODO: Fetch posts from API
        posts = [Post(id: 1, slug: "hola", url: "url", title: "This is the title", content: "This is a content, and is longer", image: "imageurl", thumbnail: "thumbnail", status: "this is a status", category: "category here", publishedAt: "published at??", updatedAt: "updated date!!", userID: 1), Post(id: 2, slug: "hola", url: "url", title: "This is the title", content: "This is a content, and is longer", image: "imageurl", thumbnail: "thumbnail", status: "this is a status", category: "category here", publishedAt: "published at??", updatedAt: "updated date!!", userID: 2)]
    }
    
    func getTitle() -> String {
        return "My News"
    }
}
