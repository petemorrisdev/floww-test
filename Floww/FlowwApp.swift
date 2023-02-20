//
//  FlowwApp.swift
//  Floww
//
//  Created by Morris, Peter on 18/02/2023.
//

import SwiftUI

@main
struct FlowwApp: App {
    @Environment(\.factory) var factory
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                MarketsView(
                    markets: factory.makeMarkets()
                )
                .navigationTitle("Markets")
                .navigationBarTitleDisplayMode(.inline)
            } detail: {
                EmptyView()
            }
        }
    }
}
