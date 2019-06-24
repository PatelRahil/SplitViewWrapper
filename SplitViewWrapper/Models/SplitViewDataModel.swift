//
//  SplitViewDataModel.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/18/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

public class SplitViewDataModel<DataType: Identifiable>: BindableObject {
    public var didChange = PassthroughSubject<SplitViewDataModel, Never>()
    var selectedItem: DataType? {
        didSet {
            self.didChange.send(self)
        }
    }
    var searchable = false
}
