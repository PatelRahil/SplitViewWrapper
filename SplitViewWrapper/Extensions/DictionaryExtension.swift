//
//  DictionaryExtension.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/19/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation

extension Dictionary {
    func keysArray() -> [Key] {
        var keys:[Key] = []
        for key in self.keys {
            keys.append(key)
        }
        return keys
    }
}
