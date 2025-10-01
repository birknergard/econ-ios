//
//  ExpenseItem.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 25/09/2025.
//

import SwiftUI

struct ExpenseItem: View {
    @EnvironmentObject private var store: EconStore
    var expense: EstimatedExpense

    @State private var editing = false
    @State private var deleting = false

    var body: some View {
        ListItem(
            name: expense.name,
            amount: expense.amount,
            onDelete: {deleting.toggle()},
            onEdit: {editing.toggle()},
            color: .accentRed
        )
        .sheet(isPresented: $editing) {
            ExpenseSheet(
                start: expense,
            )
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
        }
        .alert(
            "Are you sure you want to delete \(expense.name.capitalized) entry?",
            isPresented: $deleting
        ) {
            Button("Cancel", role: .cancel) {
                print("Deleted \(expense.name) entry")
            }
            Button("Confirm", role: .destructive) {
                store.remove(object: self.expense)
                print("Deleted \(expense.name) entry")
            }
        }
    }
}
