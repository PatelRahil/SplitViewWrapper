//
//  Person.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/18/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation
import SwiftUI

struct Person: Identifiable, Loopable, Searchable {
    var name: String
    var searchableText: String {
        get {
            return name
        }
    }
    var id: String
    init() {
        self.name = ""
        self.id = "0"
    }
    init(name: String, id: String) {
        self.name = name
        self.id = id
    }
}

typealias SplitViewDataType = Loopable & Identifiable & Searchable
