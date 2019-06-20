//
//  PersonDataModel.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/18/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation

class PersonDataModel: SplitViewDataSource {
    var people = [
        Person(name: "John", id: "0"),
        Person(name: "Jerry", id: "1"),
        Person(name: "Mary", id: "2"),
        Person(name: "Liz", id: "3"),
        Person(name: "Harry", id: "4")
    ]
    
    func downloadData(success: @escaping ([Person]) -> (), fail: @escaping (String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            success(self.people)
        }
    }
    init() {
        print(DataType.self)
    }
}
