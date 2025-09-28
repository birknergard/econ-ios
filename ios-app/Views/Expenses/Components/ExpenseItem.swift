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
    @State private var toggleEditSheet = false
    @State private var deleting = false

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("\(expense.name.capitalized)").font(.system(size: 16))
                    .foregroundColor(.white)
                Image(systemName: "arrow.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 13, height: 13)
                Text(String(format: "%.0f NOK", expense.cost)).font(
                    .system(size: 16)
                )
                .foregroundColor(.white)
                Spacer()
                if !editing {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: 15, height: 15)
                }
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 20)

            if editing {
                HStack(spacing: 0) {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .padding([.top, .bottom], 10)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray)
                        .onTapGesture {
                            toggleEditSheet.toggle()
                        }

                    Image(systemName: "xmark.bin.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .padding([.top, .bottom], 10)
                        .onTapGesture {
                            deleting.toggle()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.textDark)
                }
                .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.accentGreen)
        .clipShape(
            RoundedRectangle(cornerRadius: roundedRadius, style: .circular)
        )
        .shadow(radius: 2)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                editing.toggle()
            }
        }
        .sheet(isPresented: $toggleEditSheet) {
            CreatorSheet(
                isEditing: true,
                oldExpense: expense,
                name: self.expense.name.capitalized,
                cost: self.expense.cost,
                category: self.expense.category
            )
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
        }
        .alert(
            "Are you sure you want to delete \(expense.name.capitalized) entry?",
            isPresented: $deleting
        ){
            Button("Cancel", role: .cancel){
                print("Deleted \(expense.name) entry")
            }
            Button("Confirm", role: .destructive){
                store.removeExpense(expense: self.expense)
                print("Deleted \(expense.name) entry")
            }
        }

    }
}
