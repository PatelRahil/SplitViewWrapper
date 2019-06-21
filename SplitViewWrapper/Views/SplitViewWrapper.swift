//
//  SplitViewWrapper.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/19/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import SwiftUI

public struct SplitViewWrapper<DataSource: SplitViewDataSource, ListItemView: SplitViewListItemProtocol, DetailView: SplitViewDetailProtocol>: View {
    var wrapperData: SplitViewWrapperData<DataSource, ListItemView, DetailView>
    var dataSource: DataSource {
        wrapperData.dataSource
    }
    public var body: some View {
        return SplitViewWrapperView<DataSource, ListItemView, DetailView>(dataSource: dataSource)
            .environmentObject(wrapperData.searchableSplitViewDataModel)
            .environmentObject(wrapperData.splitViewModel)
    }
    public init(wrapperData: SplitViewWrapperData<DataSource, ListItemView, DetailView>) {
        self.wrapperData = wrapperData
    }
}

/*
#if DEBUG
struct SplitViewWrapper_Previews : PreviewProvider {
    static var previews: some View {
        SplitViewWrapper()
    }
}
#endif
*/
