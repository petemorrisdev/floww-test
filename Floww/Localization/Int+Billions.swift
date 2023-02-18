import Foundation

extension Int {
    private enum Constants {
        static let oneBillion = 1000000000.0
    }
    
    var numberOfBillions: Double {
        Double(self) / Constants.oneBillion
    }
}
