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

    @State var editing: Bool = false
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("\(expense.name)").font(.system(size: 16))
                    .foregroundColor(.white)
                Image(systemName: "arrow.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 13, height: 13)
                Text(String(format: "%.0f NOK", expense.cost)).font(.system(size: 16))
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

                    Image(systemName: "xmark.bin.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .padding([.top, .bottom], 10)
                        .onTapGesture {
                            store.removeExpense(expense: self.expense)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.textDark)
                }
                .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.accentGreen)
        .clipShape(RoundedRectangle(cornerRadius: roundedRadius, style: .circular))
        .shadow(radius: 2)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)){
                editing.toggle()
            }
        }
    }
}
