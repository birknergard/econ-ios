import Foundation
import SwiftData

@Model
class Income: Identifiable {
    public var id: UUID
    public var name: String
    public var amount: Double
    
    init(id: UUID, name: String, amount: Double) {
        self.id = id
        self.name = name
        self.amount = amount
    }
}
