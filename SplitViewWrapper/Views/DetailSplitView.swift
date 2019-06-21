//
//  DetailSplitView.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/18/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import SwiftUI
struct DetailSplitView<DataType: Searchable & Identifiable & Loopable, ListItemType: SplitViewListItemProtocol, DetailViewType: SplitViewDetailProtocol> : View {
    
    @EnvironmentObject var dataModel: SearchableSplitViewDataModel<DataType>
    @EnvironmentObject var model: SplitViewModel<ListItemType, DetailViewType>
    var selectedItem: DataType {
        return dataModel.selectedItem
    }
    var props: [String: String] {
        return dataModel.getPrintableProps().0
    }
    var body: some View {
        var view = model.splitViewDetailTemplate
        view.data = selectedItem as! DetailViewType.DataType
        return view
        /*
        NavigationView {
            Form {
                ForEach(dataModel.alphabeticPropKeys().identified(by: \.self)) { prop -> Text in
                    return Text("\(prop): \(self.props[prop] ?? "-")")
                }
            }
            .navigationBarTitle(Text("Details"))
        }
         */
    }
}

/*
#if DEBUG
struct DetailSplitView_Previews : PreviewProvider {
    static var previews: some View {
        DetailSplitView()
    }
}
#endif
*/

