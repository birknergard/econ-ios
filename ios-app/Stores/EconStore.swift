import SwiftData
import Combine

class EconStore: ObservableObject {
    /* Service object, not in use right now */
    // let service: EconService = EconService()
    var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    let categories: [String] = Category.allCases.map { $0.rawValue }

    func mapExpensesToCategory(expenses: [EstimatedExpense]) -> [String : [EstimatedExpense]]{
        var map: [String : [EstimatedExpense]] = [:]
        
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
    
    func add(new: any PersistentModel) -> Bool {
        do {
            context.insert(new)
            try context.save()
            return true
        } catch {
            return false
        }
    }
    
    func edit(old: any PersistentModel, new: any PersistentModel) -> Bool {
        do {
            if old.id != new.id {
                context.delete(old)
            }
            context.insert(new)
            try context.save()
            return true
        } catch {
            return false
        }
    }

    
    func remove(object: any PersistentModel) -> Bool {
        do {
            context.delete(object)
            try context.save()
            return true
        } catch {
            return false
        }

    }
}
