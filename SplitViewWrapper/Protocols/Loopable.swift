//
//  Loopable.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/18/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation

public protocol Loopable {
    func allProperties(limit: Int) -> [String: Any]
    func allPrintableProperties(limit: Int) -> ([String: String], [String: Any])
    init()
}
