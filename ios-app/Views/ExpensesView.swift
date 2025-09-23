//
//  ExpensesView.swift
//  ios
//
//  Created by Birk Kristinius Nergård on 17/09/2025.
//

import SwiftUI

struct ExpensesView: View {
    @EnvironmentObject var store: EconStore
    
    @State var sum: Int = 0  // Test value
    @State var creating: Bool = false

    var body: some View {
        VStack {
            VStack {
                Text("SUM (Monthly)")
                    .font(.system(size: 25))
                HStack {
                    Image(systemName: "minus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    Text("\(sum),-")
                        .font(.system(size: 50))
                }
                .foregroundColor(.red)
                Spacer()
                    .frame(height: 20)
            }
            .frame(maxWidth: .infinity)
            .overlay(  // Bottom border
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.gray),
                alignment: .bottom
            )

            ZStack(alignment: .bottomTrailing) {
                
                NavigationLink(destination: CreateExpenseView()) {
                    Image(systemName: "document.badge.plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .background(Circle().fill(.white))
                        .foregroundColor(.red)
                }
                .padding()
                .buttonStyle(.plain)
                .background(
                    Circle()
                        .fill(.white)
                        .frame(width: 65, height: 65)
                        .shadow(color: .gray.opacity(0.5), radius: 5)
                )
                .padding([.trailing, .bottom], 15)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
            )
            .padding([.leading, .bottom, .trailing], 10)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .top
        )
        .padding(.top, 50)
    }
}

#Preview {
    ExpensesView()
}
