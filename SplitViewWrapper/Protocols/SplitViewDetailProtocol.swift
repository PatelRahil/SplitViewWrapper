//
//  SplitViewDetailProtocol.swift
//  SplitViewWrapper
//
//  Created by Rahil Patel on 6/21/19.
//  Copyright © 2019 RahilPatel. All rights reserved.
//

import Foundation
import SwiftUI

public protocol SplitViewDetailProtocol: View {
    associatedtype DataType: Identifiable
    var data: DataType? { get set }
}
