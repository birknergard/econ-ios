//
//  CategoryTable.swift
//  ios
//
//  Created by Birk Kristinius Nergård on 17/09/2025.
//

import SwiftUI

private let roundedRadius: CGFloat = 25

struct CategoryTable: View {
    var title: String = "Unknown"
    var items: [Expense] = []
    var categoryTotal: Double = 0  // Test value

    @State var isListView: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(title)").font(.title)

                    (items.isEmpty || categoryTotal <= 0
                        ? Text("Category is empty.")
                        : Text("Contains \(items.count) entries."))
                        .font(.caption)
                }

                Spacer()

                (items.isEmpty
                    ? Text("0,-")
                    : Text(String(format: "%.0f,-", categoryTotal)))
                    .font(.title)

                Image(systemName: isListView ? "chevron.up" : "chevron.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .padding(.leading, 10)
            }
            .padding([.leading, .trailing], 20)
            .padding(.top, isListView ? 15 : 30)
            .padding(.bottom, isListView ? 15 : 30)
            .clipShape(!isListView
                       ? AnyShape(RoundedRectangle(cornerRadius: roundedRadius))
                       : AnyShape(Rectangle()))
            .foregroundColor(.white)
            
            if isListView {
                ExpenseList(expenses: items)
                    .padding([.leading, .trailing, .bottom], 3)
            }
        }
        .background(isListView ? Color.accentLightRed : Color.accentRed)
        .clipShape(RoundedRectangle(cornerRadius: roundedRadius))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)){
                isListView.toggle()
            }
        }
    }
}

struct ExpenseList: View {
    var expenses: [Expense]
    var body: some View {
        VStack {
            ForEach(expenses, id: \.self) { expense in
                VStack(alignment: .leading) {
                    Text(expense.name).font(.headline.bold())
                    Text(String(format: "%.2f,-", expense.cost)).font(.title3)
                }
            }
        }
        .padding([.leading, .trailing], 10)
        .padding([.top, .bottom], 20)
        .frame(maxWidth: .infinity, alignment: .bottom)
        .background(Color.background)
        .foregroundColor(.textDark)
        .clipShape(RoundedRectangle(cornerRadius: roundedRadius))
    }
}

#Preview {
    CategoryTable()
}
