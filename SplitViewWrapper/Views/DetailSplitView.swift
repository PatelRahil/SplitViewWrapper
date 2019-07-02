//
//  DetailSplitView.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/18/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import SwiftUI
struct DetailSplitView<DataType: Searchable & Identifiable, ListItemType: SplitViewListItemProtocol, DetailViewType: SplitViewDetailProtocol, HeaderViewType: SplitViewHeaderProtocol> : View {
    
    @EnvironmentObject var dataModel: SearchableSplitViewDataModel<DataType>
    @EnvironmentObject var model: SplitViewModel<ListItemType, DetailViewType, HeaderViewType>
    var selectedItem: DataType? {
        return dataModel.selectedItem
    }
    var body: some View {
        var view = model.splitViewDetailTemplate
        view.data = selectedItem as! DetailViewType.DataType?
        return view
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

