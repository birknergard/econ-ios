internal import Combine
import Foundation

class EconStore: ObservableObject {
    let service: EconService = EconService()

    @Published var expenses: [Expense]
    @Published var incomes: [Income]
    
    let categories: [String] = [
        "Housing", "Food", "Transport", "Other", "Savings", "Debt",
    ]

    func createExpense(expense: Expense) async {
        do {
            try await self.service.createExpense(expense: expense)
        } catch {
           print("Failed to create expense")
        }
    }
    
    func fetchExpenses() async -> [Expense] {
        do {
            return try await self.service.getAllExpenses()
        } catch {
            print("Failed to fetch expenses")
            return [Expense]()
        }
    }
    
    init() {
        self.expenses = [Expense]()
        self.incomes = [Income]()
    }
}
