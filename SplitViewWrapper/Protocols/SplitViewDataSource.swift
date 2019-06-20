//
//  SplitViewDataSource.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/18/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation
import SwiftUI

public protocol SplitViewDataSource {
    associatedtype DataType: Loopable & Searchable & Identifiable
    func downloadData(success: @escaping ([DataType]) -> (), fail: @escaping (String) -> ())
}
