import Foundation
import SwiftData

@Model
class EstimatedExpense: Identifiable {
    var name: String
    var amount: Double
    var category: String

    init(name: String, amount: Double, category: String) {
        self.name = name
        self.amount = amount
        self.category = category
    }
}
