import SwiftUI
import Charts

struct MarketDetailView: View {
    private enum Constants {
        static let padding = 8.0
        static let imageSize = CGSize(width: 60.0, height: 60.0)
    }
    
    @State var marketDetail: MarketDetail
    
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.padding) {
            HeaderView(
                market: marketDetail.market,
                date: marketDetail.date
            )
            .padding(.horizontal)
            
            if let chart = marketDetail.chart {
                
                // MARK: Chart
                
                Charts.Chart(chart.marks) { mark in
                    LineMark(
                        x: .value(mark.xLabel, mark.date),
                        y: .value(mark.yLabel, mark.price)
                    )
                }
                
            } else if marketDetail.errorMessage != nil {
                
                RefreshButton {
                    Task {
                        await marketDetail.fetch()
                    }
                }
                
            } else {
                
               LoadingView()
                
            }
        }
        .task {
            await marketDetail.fetch()
        }
        .errorBanner(message: marketDetail.errorMessage)
    }
    
    // MARK: HeaderView
    
    private struct HeaderView: View {
        let market: LocalizedMarket
        let date: String
        
        var body: some View {
            HStack {
                
                // MARK: Image
                
                StandardImage(
                    image: market.image,
                    size: Constants.imageSize
                )
                .padding(.trailing, Constants.padding)
                
                VStack(alignment: .leading) {
                    
                    // MARK: Market Details
                    
                    Text(market.symbol)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .font(.title3.bold())
                    
                    Text(market.price)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .font(.subheadline)
                    
                    Text(date)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .font(.subheadline)
                }
            }
        }
    }
    
    // MARK: LoadingView
    
    private struct LoadingView: View {
        var body: some View {
            Spacer()
            HStack {
                ProgressView()
            }
            .frame(minWidth: .zero, maxWidth: .infinity)
            Spacer()
        }
    }
    
    // MARK: Refresh button
    
    private struct RefreshButton: View {
        let action: () -> Void
        
        var body: some View {
            Spacer()
            Button("Refresh", action: action)
                .frame(minWidth: .zero, maxWidth: .infinity)
            Spacer()
        }
    }
}

#if DEBUG
struct MarketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MarketDetailView(
            marketDetail: MarketDetail(
                market: LocalizedMarket.previewData[0],
                store: MarketDetailStorePreview()
            )
        )
    }
}
#endif
