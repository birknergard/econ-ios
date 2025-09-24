import Foundation
import SwiftData

@Model
class Income: Identifiable {
    public var id: UUID
    public var name: String
    public var amount: Double
    
    init(name: String, amount: Double) {
        self.id = UUID()
        self.name = name
        self.amount = amount
    }
}
