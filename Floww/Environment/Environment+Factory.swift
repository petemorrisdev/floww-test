import SwiftUI

struct FactoryKey: EnvironmentKey {
    static var defaultValue: AppFactory = AppFactory()
}

extension EnvironmentValues {
    var factory: AppFactory {
        self[FactoryKey.self]
    }
}
