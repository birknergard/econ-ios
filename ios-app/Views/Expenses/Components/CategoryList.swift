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

    var body: some View {
        ScrollView {
            Rectangle()
                .frame(height: 5)
                .foregroundColor(.clear)
            ForEach(store.categories, id: \.self) { category in
                let expensesForCategory = sortedExpenses[category] ?? []
                let sum = expensesForCategory.reduce(0.0) { $0 + $1.cost }

                CategoryTable(
                    category: category,
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
