//
//  SplitViewList.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 7/2/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import SwiftUI

struct SplitViewList<DataSource: SplitViewDataSource, ListItemType: SplitViewListItemProtocol, DetailViewType: SplitViewDetailProtocol, HeaderViewType: SplitViewHeaderProtocol> : View {
    @EnvironmentObject var splitViewModel: SplitViewModel<ListItemType, DetailViewType, HeaderViewType>
    @EnvironmentObject var splitViewDataModel: SearchableSplitViewDataModel<DataSource.DataType>
    var body: some View {
        List {
            ForEach(splitViewDataModel.displayedItems) { item -> SplitViewListItem<DataSource, ListItemType> in
                var listItemView = self.splitViewModel.splitViewListItemTemplate
                let item = item as! ListItemType.DataType
                listItemView.data = item
                let listItem = SplitViewListItem<DataSource, ListItemType>(item: item, itemView: listItemView)
                return listItem
            }
        }
    }
}

/*
#if DEBUG
struct SplitViewList_Previews : PreviewProvider {
    static var previews: some View {
        SplitViewList()
    }
}
#endif
*/
