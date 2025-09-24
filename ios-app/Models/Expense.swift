import Foundation
import SwiftData

@Model
class Expense: Identifiable {
    public var name: String
    public var cost: Double
    public var category: String
    
    init(name: String, cost: Double, category: String) {
        self.name = name
        self.cost = cost
        self.category = category
    }
}
