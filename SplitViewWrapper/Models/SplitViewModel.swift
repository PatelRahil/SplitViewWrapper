//
//  SplitViewModel.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/18/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public class SplitViewModel<CustomListView: SplitViewListItemProtocol, CustomDetailView: SplitViewDetailProtocol, CustomHeaderView: SplitViewHeaderProtocol>: BindableObject {
    public var didChange = PassthroughSubject<SplitViewModel<CustomListView, CustomDetailView, CustomHeaderView>, Never>()
    let splitViewListItemTemplate: CustomListView
    let splitViewDetailTemplate: CustomDetailView
    let splitViewHeader: CustomHeaderView?
    public var searchable = false
    
    public init<T: SplitViewListItemProtocol, U: SplitViewDetailProtocol, V: SplitViewHeaderProtocol>(listTemplate: T, detailTemplate: U, header: V? = nil) where T.DataType == U.DataType {
        self.splitViewListItemTemplate = listTemplate as! CustomListView
        self.splitViewDetailTemplate = detailTemplate as! CustomDetailView
        self.splitViewHeader = header as! CustomHeaderView?
    }
}

public struct DummyView: SplitViewHeaderProtocol {
    public var body: some View {
        EmptyView()
    }
    public init() {
        
    }
}
