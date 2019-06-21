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

public class SplitViewModel<CustomListView: SplitViewListItemProtocol, CustomDetailView: SplitViewDetailProtocol>: BindableObject {
    public var didChange = PassthroughSubject<SplitViewModel<CustomListView, CustomDetailView>, Never>()
    let splitViewListItemTemplate: CustomListView
    let splitViewDetailTemplate: CustomDetailView
    public init(listTemplate: CustomListView, detailTemplate: CustomDetailView) {
        self.splitViewListItemTemplate = listTemplate
        self.splitViewDetailTemplate = detailTemplate
    }
}
