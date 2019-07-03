//
//  SearchableSplitViewDataModel.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/18/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

public final class SearchableSplitViewDataModel<SearchableDataType: Identifiable & Searchable>: SplitViewDataModel<SearchableDataType> {
    public var allItems: [SearchableDataType] = []
    public var displayedItems: [SearchableDataType] = [] {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
        }
    }
    public var searchTerm: String?
    
    public override init() {
        super.init()
        searchable = true
        print("DataModel type: \(SearchableDataType.Type.self)")
    }
    func search(_ searchTerm: String) {
        let searchedItems: [SearchableDataType] = allItems.filter {
            $0.searchableText.hasPrefix(searchTerm)
        }
        displayedItems = searchedItems
    }
    public func refreshSearch() {
        if let searchTerm = self.searchTerm {
            self.filterDisplayed(searchTerm)
        }
    }
    private func filterDisplayed(_ searchTerm: String) {
        let searchedItems: [SearchableDataType] = displayedItems.filter {
            $0.searchableText.hasPrefix(searchTerm)
        }
        displayedItems = searchedItems
    }
}
