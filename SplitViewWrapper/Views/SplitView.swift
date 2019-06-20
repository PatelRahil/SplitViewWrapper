//
//  ContentView.swift
//  MTI Test app
//
//  Created by https://github.com/a2 on 6/5/19.
//  MIT License
//

import SwiftUI

public struct SplitView<Master: View, Detail: View>: View {
    public var master: Master
    public var detail: Detail
    @State public var preferredDisplayMode: UISplitViewController.DisplayMode
    
    public var body: some View {
        let controllers = [UIHostingController(rootView: master), UIHostingController(rootView: detail)]
        return SplitViewController(controllers: controllers, preferredDisplayMode: $preferredDisplayMode)
    }
}

public extension SplitView {
    init(master: Master, detail: Detail) {
        self.init(master: master, detail: detail, preferredDisplayMode: .automatic)
    }
    
    func preferredDisplayMode(_ preferredDisplayMode: UISplitViewController.DisplayMode) -> Self {
        return SplitView(master: master, detail: detail, preferredDisplayMode: preferredDisplayMode)
    }
}
