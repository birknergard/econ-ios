//
//  ExpensesView.swift
//  ios
//
//  Created by Birk Kristinius Nergård on 17/09/2025.
//

import SwiftUI
import SwiftData

struct ExpensesView: View {
    @Environment(\.modelContext) var context
    @Query var expenses: [Expense]
    
    private var sum: Double {
        expenses.reduce(0.0) {$0 + $1.cost}
    }
    
    @State var creating: Bool = false

    var body: some View {
        VStack (spacing: 0){
            VStack {
                Text("Monthly sum of expenses")
                    .font(.subheadline)
                HStack {
                    Image(systemName: "minus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    Text(String(format: "%d,-", sum))
                        .font(.system(size: 50))
                }
                .foregroundColor(.accentRed)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 15)
            .overlay(
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.textDark),
                alignment: .bottom
            )

            ZStack(alignment: .bottomTrailing) {
                CategoryList(expenses: expenses)
                
                // Add new
                NavigationLink(destination: Creator(context: context)) {
                    Image(systemName: "document.badge.plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .background(Circle().fill(Color.background))
                        .foregroundColor(.red)
                }
                .buttonStyle(.plain)
                .background(
                    Circle()
                        .fill(Color.background)
                        .frame(width: 65, height: 65)
                        .shadow(color: .gray.opacity(0.5), radius: 5)
                )
                .padding(30)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
            )
        }
        .frame(
            maxWidth: .infinity,
            alignment: .top
        )
        .background(Color.background)
    }
}
