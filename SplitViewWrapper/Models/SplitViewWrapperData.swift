//
//  SplitViewWrapperData.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/19/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation

public class SplitViewWrapperData<DataSource: SplitViewDataSource, ListViewItem: SplitViewListItemProtocol, DetailViewItem: SplitViewDetailProtocol, HeaderView: SplitViewHeaderProtocol> {
    var dataSource: DataSource
    var searchableSplitViewDataModel: SearchableSplitViewDataModel<DataSource.DataType>
    var splitViewModel: SplitViewModel<ListViewItem, DetailViewItem, HeaderView>
    public init<T: SplitViewDataSource, U: SplitViewListItemProtocol, V: SplitViewDetailProtocol, W: SplitViewHeaderProtocol>(dataSource: T, searchableSplitViewDataModel: SearchableSplitViewDataModel<T.DataType>, splitViewModel: SplitViewModel<U,V,W>) where T.DataType == U.DataType, U.DataType == V.DataType {
        self.dataSource = dataSource as! DataSource
        self.searchableSplitViewDataModel = searchableSplitViewDataModel as! SearchableSplitViewDataModel<DataSource.DataType>
        self.splitViewModel = splitViewModel as! SplitViewModel<ListViewItem, DetailViewItem, HeaderView>
    }
    public convenience init<T: SplitViewDataSource, U: SplitViewListItemProtocol, V: SplitViewDetailProtocol, W: SplitViewHeaderProtocol>(dataSource: T, splitViewModel: SplitViewModel<U,V,W>) where T.DataType == U.DataType, U.DataType == V.DataType {
        let splitViewDataModel = SearchableSplitViewDataModel<T.DataType>()
        self.init(dataSource: dataSource, searchableSplitViewDataModel: splitViewDataModel, splitViewModel: splitViewModel)
    }
}
