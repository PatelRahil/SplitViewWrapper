//
//  SplitViewWrapperData.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/19/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation

public class SplitViewWrapperData<DataSource: SplitViewDataSource, ListViewItem: SplitViewListItemProtocol> {
    var dataSource: DataSource
    var searchableSplitViewDataModel: SearchableSplitViewDataModel<DataSource.DataType>
    var splitViewModel: SplitViewModel<ListViewItem>
    public init<T: SplitViewDataSource, V: SplitViewListItemProtocol>(dataSource: T, searchableSplitViewDataModel: SearchableSplitViewDataModel<T.DataType>, splitViewModel: SplitViewModel<V>) where T.DataType == V.DataType {
        self.dataSource = dataSource as! DataSource
        self.searchableSplitViewDataModel = searchableSplitViewDataModel as! SearchableSplitViewDataModel<DataSource.DataType>
        self.splitViewModel = splitViewModel as! SplitViewModel<ListViewItem>
    }
}
