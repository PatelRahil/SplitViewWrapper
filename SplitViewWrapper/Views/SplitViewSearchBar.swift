//
//  SplitViewSearchBar.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/18/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation
import SwiftUI

struct SplitViewSearchbar<DataType: Searchable & Identifiable> : View {
    @EnvironmentObject var dataModel: SearchableSplitViewDataModel<DataType>
    @State var searchTerm = ""
    var body: some View {
        TextField($searchTerm, placeholder: Text("Search"), onEditingChanged: { (started) in
            if !started {
                self.dataModel.search(self.searchTerm)
                self.dataModel.searchTerm = self.searchTerm
            }
        })
    }
}
