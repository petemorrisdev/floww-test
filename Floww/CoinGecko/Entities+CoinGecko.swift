import Foundation

extension Currency {
    var paramName: String {
        CoinGecko.Param.currency
    }
    
    var paramValue: String {
        switch self {
        case .usd: return CoinGecko.Value.usd
        }
    }
}

extension Order {
    var paramName: String {
        CoinGecko.Param.order
    }
    
    var paramValue: String {
        switch self {
        case .marketCapDescending: return CoinGecko.Value.marketCapDescending
        }
    }
}

extension Interval {
    var paramName: String {
        CoinGecko.Param.interval
    }
    
    var paramValue: String {
        switch self {
        case .daily: return CoinGecko.Value.daily
        }
    }
}

extension Period {
    var paramName: String {
        CoinGecko.Param.days
    }
    
    var paramValue: String {
        switch self {
        case .oneYear: return CoinGecko.Value.oneYear
        }
    }
}
