//
//  SplitViewListItem.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/19/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import SwiftUI

struct SplitViewListItem<DataSource: SplitViewDataSource, ListItemType: SplitViewListItemProtocol> : View {
    @EnvironmentObject var dataModel: SearchableSplitViewDataModel<DataSource.DataType>
    var item: ListItemType.DataType
    var itemView: ListItemType
    var body: some View {
        Button(action: {
            print("\(self.item.id) was selected")
            self.dataModel.selectedItem = self.item as! DataSource.DataType
        }) {
            itemView
        }
    }
}

/*
#if DEBUG
struct SplitViewListItem_Previews : PreviewProvider {
    static var previews: some View {
        SplitViewListItem()
    }
}
#endif
*/
