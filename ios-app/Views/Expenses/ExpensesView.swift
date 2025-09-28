//
//  ExpensesView.swift
//  ios
//
//  Created by Birk Kristinius Nergård on 17/09/2025.
//

import SwiftUI
import SwiftData

struct ExpensesView: View {
    @EnvironmentObject var store: EconStore
    @Environment(\.dismiss) var dismiss
    
    @Query var expenses: [EstimatedExpense]
    @State var creating: Bool = false

    var body: some View {
        VStack (spacing: 0){
            VStack(alignment: .center, spacing: 0) {
                Text("Monthly Expenses, estimated")
                    .font(.subheadline)
                    .foregroundColor(.textDark)
                HStack {
                    Image(systemName: "minus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    Text(String(format: "%.0f NOK", expenses.reduce(0.0) {$0 + $1.cost}))
                        .font(.system(size: 50))
                }
                .foregroundColor(.accentRed)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 15)
            .overlay(
                Rectangle()
                    .frame(height: 0.2)
                    .foregroundColor(.textDark),
                alignment: .bottom
            )

            ZStack(alignment: .bottomTrailing) {
                CategoryList(expenses: expenses, toggleCreateSheet: $creating)
                
                // Add new
                Button(action: {
                    creating = true
                }) {
                    Image(systemName: "document.badge.plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .background(Circle().fill(Color.white))
                        .foregroundColor(.red)
                }
                .buttonStyle(.plain)
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 65, height: 65)
                        .shadow(color: .gray.opacity(0.5), radius: 5)
                )
                .padding(30)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
            )
        .frame(
            maxWidth: .infinity,
            alignment: .top
        )
        .background(Color.white)
        }.sheet(isPresented: $creating){
           CreatorSheet()
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }
}
