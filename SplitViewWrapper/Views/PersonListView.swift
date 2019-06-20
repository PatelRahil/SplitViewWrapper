//
//  PersonListView.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/18/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import SwiftUI

struct PersonListView : SplitViewListItemProtocol {
    var data: Person?
    var body: some View {
        Text(data?.name ?? "")
    }
}

#if DEBUG
struct PersonListView_Previews : PreviewProvider {
    static var previews: some View {
        PersonListView(data: Person(name: "John", id: "0"))
    }
}
#endif
