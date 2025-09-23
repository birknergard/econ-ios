import Foundation
import SwiftData

@Model
class Expense: Identifiable {
    public var id: UUID
    public var name: String
    public var cost: Double
    public var category: String
    
    init(id: UUID, name: String, cost: Double, category: String) {
        self.id = id
        self.name = name
        self.cost = cost
        self.category = category
    }
}
