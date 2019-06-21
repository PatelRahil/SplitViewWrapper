//
//  MasterSplitView.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/18/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import SwiftUI

struct MasterSplitView<DataSource: SplitViewDataSource, ListItemType: SplitViewListItemProtocol, DetailViewType: SplitViewDetailProtocol> : View {
    @EnvironmentObject var splitViewModel: SplitViewModel<ListItemType, DetailViewType>
    var items:[DataSource.DataType]
    var body: some View {
        VStack {
            SplitViewSearchbar<DataSource.DataType>().padding()
            List {
                ForEach(items) { item -> SplitViewListItem<DataSource, ListItemType> in
                    var listItemView = self.splitViewModel.splitViewListItemTemplate
                    let item = item as! ListItemType.DataType
                    listItemView.data = item
                    let listItem = SplitViewListItem<DataSource, ListItemType>(item: item, itemView: listItemView)
                    return listItem
                }
            }
        }
    }
}

/*
#if DEBUG
struct MasterSplitView_Previews : PreviewProvider {
    @State static var items = PersonDataModel().people
    static var previews: some View {
        MasterSplitView<Person>(items: $items)
    }
}
#endif
*/

