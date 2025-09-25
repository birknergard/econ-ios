import SwiftData
import Combine

class EconStore: ObservableObject {
    /* Service object, not in use right now */
    // let service: EconService = EconService()
    var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    let categories: [String] = [
        "housing", "food", "transport", "other", "savings", "debt"
    ]

    func mapExpensesToCategory(expenses: [Expense]) -> [String : [Expense]]{
        var map: [String : [Expense]] = [:]
        
        for expense in expenses {
            let category = expense.category
            
            // Ignore invalid expense categories, checked against constant
            if !self.categories.contains(category) { continue }
            
            if map[category] == nil {
                map[category] = [expense]
                continue
            }
            
            map[category]?.append(expense)
        }
        return map
    }
    
    func addExpense(expense: Expense) -> Bool {
        do {
            context.insert(expense)
            try context.save()
            return true
        } catch {
            return false
        }
    }
}
