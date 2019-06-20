//
//  SplitViewWrapperView.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/18/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import SwiftUI

struct SplitViewWrapperView<DataSource: SplitViewDataSource, ListItemType: SplitViewListItemProtocol> : View {
    @EnvironmentObject var splitViewDataModel: SearchableSplitViewDataModel<DataSource.DataType>
    var dataSource: DataSource
    var body: some View {
        return SplitView(master: MasterSplitView<DataSource, ListItemType>(items: splitViewDataModel.displayedItems), detail: DetailSplitView<DataSource.DataType>())
            .onAppear {
                self.dataSource.downloadData(success: { (items) in
                    self.splitViewDataModel.allItems = items
                    self.splitViewDataModel.displayedItems = items
                }) { (errorDescription) in
                    print(errorDescription)
                }
            }
        
    }
}

/*
#if DEBUG
struct SplitViewWrapperView_Previews : PreviewProvider {
    static var previews: some View {
        SplitViewWrapperView(dataSource: PersonDataModel())
    }
}
#endif
*/
