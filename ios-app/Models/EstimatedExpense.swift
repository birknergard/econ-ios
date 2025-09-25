import Foundation
import SwiftData

@Model
class EstimatedExpense: Identifiable {
    @Attribute(.unique) var name: String
    var cost: Double
    var category: String
    // TODO: Add dateCreated and dateLastModified

    init(name: String, cost: Double, category: String) {
        self.name = name
        self.cost = cost
        self.category = category
    }
}
