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
            // TODO: Add a factory that consumes all these dependencies. No need for the
            // view to be aware of all these details:
            //  https://github.com/petemorrisdev/floww-test/issues/22
            MarketsView(
                markets: Markets(
                    store: Store(
                        coinAPI: CoinGeckoAPI(
                            http: HTTPClient(
                                session: URLSession.shared,
                                decoder: CoinGecko.jsonDecoder
                            )
                        ),
                        marketFormatter: MarketFormatter(currencySymbol: "$")
                    )
                )
            )
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
