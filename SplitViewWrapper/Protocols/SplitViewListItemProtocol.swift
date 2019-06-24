//
//  SplitViewListItemProtocol.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/19/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation
import SwiftUI

public protocol SplitViewListItemProtocol: View {
    associatedtype DataType: Identifiable
    var data: DataType? { get set }
}
