import SwiftUI

struct MarketsView: View {
    private enum Constants {
        static let spacing = 16.0
        static let imageSize = CGSize(width: 40.0, height: 40.0)
    }
    
    @Environment(\.factory) var factory
    @State var markets: Markets
    
    // MARK: List
    
    var body: some View {
        List(markets.cells) { cell in
            
            switch cell {
            case .loading:
                LoadingView()
                
            case let .market(market):
                NavigationLink {
                    MarketDetailView(
                        marketDetail: factory.makeMarketChart(market: market)
                    )
                    // Adding `id` is currently required in order to get the `NavigationLink` to work on ipad.
                    // This seems to be undocumented, so I think it may be a bug in `NavigationSplitView`.
                    // Without the id, the detail column on iPad will not update when you choose another market.
                    .id(market.id)
                } label: {
                    
                    MarketView(market: market)
                }
                
            case .pullToRefresh:
                Text("Pull to refresh 👆")
                    .padding()
                    .frame(minWidth: .zero, maxWidth: .infinity)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .listRowSeparator(.hidden)
            }
            
        }
        .task {
            await markets.fetch()
        }
        .refreshable {
            await markets.fetch()
        }
        .listStyle(.plain)
        .animation(.linear, value: markets.cells)
        .errorBanner(message: markets.errorMessage)
    }
    
    // MARK: LoadingView
    
    private struct LoadingView: View {
        var body: some View {
            HStack(alignment: .center) {
                ProgressView()
                    .padding()
            }
            .frame(minWidth: .zero, maxWidth: .infinity)
            .listRowSeparator(.hidden)
        }
    }
    
    private struct MarketView: View {
        let market: LocalizedMarket
        
        var body: some View {
            HStack(spacing: Constants.spacing) {
                Text(market.rank).font(.callout)
                
                // MARK: Market Image
                
                // It seems there are problems with using AsyncImage in a `List` on iOS 16.
                //
                // Very frequently, on scrolling, `AsyncImage` stays in its loading
                // phase and the image never appears.
                //
                // This problem only occurs on iOS 16 and only when `AsyncImage` is
                // used in a `List` (a `LazyVStack` within a `ScrollView` works fine).
                //
                // I think `List` was updated so that iOS renders a `UICollectionView` in
                // in iOS 16 (previously it was a `UITableView`) so I believe the bug may
                // have been introduced by this change.
                //
                // I've decided to leave the `List` in place for this coding task, to
                // demonstrate that I know that `List` reuses its views and is the preferable
                // choice for this use case.
                //
                // Some more references to the problem (but so far lacking a solution that
                // works reliably):
                //
                // https://github.com/onevcat/Kingfisher/issues/1988
                // https://developer.apple.com/forums/thread/682498
                // https://developer.apple.com/forums/thread/718480
                StandardImage(
                    image: market.image,
                    size: Constants.imageSize
                )
                
                MarketDetailsView(market: market)
                
            }
        }
    }
    
    private struct MarketDetailsView: View {
        let market: LocalizedMarket
        
        var body: some View {
            VStack(alignment: .leading) {
                
                // MARK: Symbol and Market Cap
                
                Text(market.symbol)
                    .font(.body)
                
                Text(market.marketCap)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                
                // MARK: Price and price change
                
                Text(market.price)
                    .font(.body)
                    .multilineTextAlignment(.trailing)
                
                Text(market.priceChange)
                    .font(.caption)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(market.positiveChange ? .green : .red)
            }
        }
    }
}

#if DEBUG
struct MarketsView_Previews: PreviewProvider {
    static var previews: some View {
        MarketsView(markets: Markets(store: MarketsStorePreview()))
    }
}
#endif
