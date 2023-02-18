import SwiftUI

struct MarketsView: View {
    private enum Constants {
        static let spacing = 16.0
        static let imageTransaction = Transaction(animation: .default)
        static let imageSize = 40.0
    }
    
    // We probably want a another struct called Markets to have the
    // responsibility for this array, and managing view state.
    // Will see what kind of logic is required as the shape of
    // this View code progresses
    //
    // TODO: Move this into a `Markets` struct which manages view state
    @State var cells: [MarketsCell]
    
    // MARK: List
    
    var body: some View {
        List(cells) { cell in
            
            switch cell {
            case .loading:
                LoadingView()
                
            case let .market(market):
                NavigationLink {
                    // TODO: Navigate to ChartView
                    EmptyView()
                } label: {
                    MarketView(market: market)
                }
            }
            
        }
        .listStyle(.plain)
        .animation(.linear, value: cells)
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
                AsyncImage(url: market.image, transaction: Constants.imageTransaction) { phase in
                    
                    switch phase {
                    case let .success(image):
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: Constants.imageSize, height: Constants.imageSize)
                        
                    default:
                        Color.clear
                            .frame(width: Constants.imageSize, height: Constants.imageSize)
                    }
                    
                }
                
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
        MarketsView(cells: LocalizedMarket.previewData.map(MarketsCell.market))
    }
}
#endif
