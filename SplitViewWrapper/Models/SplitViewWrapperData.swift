//
//  SplitViewWrapperData.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/19/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation

public class SplitViewWrapperData<DataSource: SplitViewDataSource, ListViewItem: SplitViewListItemProtocol, DetailViewItem: SplitViewDetailProtocol> {
    var dataSource: DataSource
    var searchableSplitViewDataModel: SearchableSplitViewDataModel<DataSource.DataType>
    var splitViewModel: SplitViewModel<ListViewItem, DetailViewItem>
    public init<T: SplitViewDataSource, U: SplitViewListItemProtocol, V: SplitViewDetailProtocol>(dataSource: T, searchableSplitViewDataModel: SearchableSplitViewDataModel<T.DataType>, splitViewModel: SplitViewModel<U,V>) where T.DataType == U.DataType {
        self.dataSource = dataSource as! DataSource
        self.searchableSplitViewDataModel = searchableSplitViewDataModel as! SearchableSplitViewDataModel<DataSource.DataType>
        self.splitViewModel = splitViewModel as! SplitViewModel<ListViewItem, DetailViewItem>
    }
}
