import Foundation
import SwiftData

// TODO: Add dateCreated and dateLastModified
@Model
class Income: Identifiable {
    var name: String
    var amount: Double
    
    init(name: String, amount: Double) {
        self.name = name
        self.amount = amount
    }
}
