//
//  SearchViewData.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 06/06/2024.
//

import Combine

protocol SearchViewData {
    var title: String { get }
    var subtitle: String { get }
}

protocol SearchViewDataProvider {
    var items: [SearchViewData] { get set }
    var searchText: String { get set }
    
    var itemsPublisher: Published<[SearchViewData]>.Publisher { get }
    var searchTextPublisher: Published<String>.Publisher { get }
    
    func getTitle() -> String
}
