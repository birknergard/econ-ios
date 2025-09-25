import Foundation
import SwiftData

@Model
class Income: Identifiable {
    var name: String
    var amount: Double
    // TODO: Add dateCreated and dateLastModified
    
    init(name: String, amount: Double) {
        self.name = name
        self.amount = amount
    }
}
