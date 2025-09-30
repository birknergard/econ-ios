//
//  ExpensesView.swift
//  ios
//
//  Created by Birk Kristinius Nergård on 17/09/2025.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    @EnvironmentObject var store: EconStore
    @Environment(\.dismiss) var dismiss

    @Query var expenses: [EstimatedExpense]
    @State var creating: Bool = false

    func enableCreationSheet() {
        creating = true
    }

    private let headerSubtitle = "Monthly Expenses, estimated"

    var body: some View {
        VStack(spacing: 0) {
            Header(
                displayedNumber: expenses.reduce(0.0) { $0 + $1.amount },
                subtitle: headerSubtitle,
                headerIcon: "minus",
                accentColor: .accentRed
            )

            ListContainer(
                accentColor: .accentRed,
                onButtonClick: enableCreationSheet
            ) {
                CategoryList(expenses: expenses, toggleCreateSheet: $creating)
            }
        }.sheet(isPresented: $creating) {
            ExpenseSheet()
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }
}
