//
//  IncomeList.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 29/09/2025.
//

import SwiftUI

struct IncomeList: View {
    @EnvironmentObject private var store: EconStore
    let incomes: [Income]
    var body: some View {
        VStack {
            ForEach(incomes, id: \.self) { income in
                ListItem(name: income.name, amount: income.amount, onDelete: { }, onEdit: { })
            }
        }
    }
}
