//
//  Untitled.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 01/10/2025.
//

import SwiftUI

struct IncomeItem: View {
    @EnvironmentObject private var store: EconStore
    var income: Income

    @State private var editing = false
    @State private var deleting = false

    var body: some View {
        ListItem(
            name: income.name,
            amount: income.amount,
            onDelete: { deleting.toggle() },
            onEdit: { editing.toggle() },
            color: .accentGreen,
            large: true
        )
        .sheet(isPresented: $editing) {
            IncomeSheet(
                start: income,
            )
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
        }
        .alert(
            "Are you sure you want to delete \(income.name.capitalized) entry?",
            isPresented: $deleting
        ) {
            Button("Cancel", role: .cancel) { }
            Button("Confirm", role: .destructive) {
                if store.remove(object: self.income) {
                    print("Deleted \(income.name) entry")
                }
            }
        }
    }
}
