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

public class SplitViewModel<CustomView: SplitViewListItemProtocol>: BindableObject {
    public var didChange = PassthroughSubject<SplitViewModel<CustomView>, Never>()
    let splitViewListItemTemplate: CustomView
    public init(listTemplate: CustomView) {
        self.splitViewListItemTemplate = listTemplate
    }
}
