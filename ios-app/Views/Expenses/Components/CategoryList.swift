//
//  CategoryList.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 22/09/2025.
//

import SwiftUI
import SwiftData

struct CategoryList: View {
    @EnvironmentObject private var store: EconStore
    var expenses: [EstimatedExpense]
    
    @State var selectedExpense: EstimatedExpense? = nil
    @Binding var toggleCreateSheet: Bool
    
    private var sortedExpenses: [String: [EstimatedExpense]] {
        store.mapExpensesToCategory(expenses: expenses)
    }
    private let categories = Category.allCases

    var body: some View {
        ScrollView {
            Rectangle()
                .frame(height: 5)
                .foregroundColor(.clear)
            ForEach(categories, id: \.self) { category in
                let expensesForCategory = sortedExpenses[category.rawValue] ?? []
                let sum = expensesForCategory.reduce(0.0) { $0 + $1.amount }

                CategoryTable(
                    category: category.rawValue,
                    items: expensesForCategory,
                    categoryTotal: sum
                )
                .padding([.top], 5)
                .padding([.leading, .trailing], 10)
            }
            Rectangle()
                .frame(height: 90)
                .foregroundColor(.clear)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}
