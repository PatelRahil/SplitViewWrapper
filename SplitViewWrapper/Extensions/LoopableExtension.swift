//
//  LoopableExtension.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/19/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation
public extension Loopable {
    func allProperties(limit: Int = Int.max) -> [String: Any] {
        return props(obj: self, count: 0, limit: limit)
    }
    
    func props(obj: Any, count: Int, limit: Int) -> [String: Any] {
        let mirror = Mirror(reflecting: obj)
        var result: [String: Any] = [:]
        
        for (prop, val) in mirror.children {
            guard let prop = prop else { continue }
            if limit == count {
                result[prop] = val
            } else {
                let subResult = props(obj: val, count: count + 1, limit: limit)
                result[prop] = subResult.count == 0 ? val : subResult
            }
        }
        return result
    }
    
    func allPrintableProperties(limit: Int = 1) -> ([String: String], [String: Any]) {
        let props = allProperties(limit: limit)
        var retProps:[String: String] = [:]
        for prop in props {
            do {
                let str = try "\(prop.value)"
                retProps[prop.key] = str
            } catch {}
        }
        return (retProps, props)
    }
}

