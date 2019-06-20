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

public class SplitViewDataModel<DataType: Identifiable & Loopable>: BindableObject {
    public var didChange = PassthroughSubject<SplitViewDataModel, Never>()
    var selectedItem: DataType = DataType() {
        didSet {
            self.didChange.send(self)
        }
    }
    var searchable = false
    func getProps() -> [String: Any] {
        return selectedItem.allProperties()
    }
    func getPrintableProps() -> ([String: String], [String: Any]) {
        return selectedItem.allPrintableProperties()
    }
    func alphabeticPropKeys() -> [String] {
        let props = getPrintableProps().0
        var arr = props.keysArray()
        arr.sort { $0 < $1 }
        return arr
    }
}
