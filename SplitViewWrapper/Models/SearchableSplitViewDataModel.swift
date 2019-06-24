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
    var allItems: [SearchableDataType] = []
    var displayedItems: [SearchableDataType] = [] {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
        }
    }
    
    public override init() {
        super.init()
        searchable = true
        print("DataModel type: \(SearchableDataType.Type.self)")
    }
}
