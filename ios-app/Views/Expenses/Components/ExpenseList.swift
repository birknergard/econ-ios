//
//  ExpenseList.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 25/09/2025.
//

import SwiftUI

struct ExpenseList: View {
    var expenses: [EstimatedExpense]
    var body: some View {
        VStack(alignment: .center) {
            ForEach(expenses, id: \.self) { expense in
                ExpenseItem(expense: expense)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)  // Approximate row height
        .padding(5)
        .foregroundColor(.textDark)
    }
}
