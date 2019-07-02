//
//  AnySplitViewListItem.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/28/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation
import SwiftUI

private class _AnySplitViewListItem<ItemType>: SplitViewListItemProtocol {
    init() {
        
    }
    var data: ItemType {
        get { fatalError("Must override") }
        set { fatalError("Must override") }
    }
    var body: some View {
        get { fatalError("Must override") }
        set { fatalError("Must override") }
    }
}
