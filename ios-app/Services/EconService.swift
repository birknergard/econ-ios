/*
import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
}

struct EconService {
    private let expenseUrl: String = "http://localhost:8080/api/econ/expense"
    private let incomeUrl: String = "http://localhost:8080/api/econ/income"

    func getAllExpenses() async throws -> [Expense] {
        guard let url = URL(string: "\(expenseUrl)") else {
            throw NetworkError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            let expenses = try JSONDecoder().decode([Expense].self, from: data)
            return expenses
        } catch {
            throw error
        }
    }
    
    func createExpense(expense: Expense) async throws -> Expense {
        guard let url = URL(string: "\(expenseUrl)") else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(expense)
            request.httpBody = jsonData
        } catch {
            throw error
        }

        let (data, _) = try await URLSession.shared.data(for: request)

        do {
            let createdExpense = try JSONDecoder().decode(
                Expense.self,
                from: data
            )
            return createdExpense
        } catch {
            throw error
        }
    }
}
*/
