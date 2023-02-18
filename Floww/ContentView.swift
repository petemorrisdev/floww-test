//
//  ContentView.swift
//  Floww
//
//  Created by Morris, Peter on 18/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            MarketsView(cells: LocalizedMarket.previewData.map(MarketsCell.market))
        } detail: {
            EmptyView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
