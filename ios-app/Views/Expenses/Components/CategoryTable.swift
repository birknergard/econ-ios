//
//  CategoryTable.swift
//  ios
//
//  Created by Birk Kristinius Nergård on 17/09/2025.
//

import SwiftUI

struct CategoryTable: View {
    var category: String = "unknown"
    var items: [EstimatedExpense] = []
    var categoryTotal: Double = 0  // Test value

    @State private var toggleCreateSheet: Bool = false
    @State private var isListView: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(category.capitalized)").font(.title)

                    if items.isEmpty || categoryTotal <= 0 {
                        Text("Category is empty.")
                    } else if !items.isEmpty && !isListView {
                        Text("Contains \(items.count) entries.")
                            .font(.caption)
                    } else {
                        Text("Showing \(items.count) entries.")
                            .font(.caption)
                    }
                }

                Spacer()

                if !items.isEmpty {
                    Text(String(format: "%.0f NOK", categoryTotal))
                        .font(.title)
                    Image(
                        systemName: isListView ? "chevron.up" : "chevron.down"
                    )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .padding(.leading, 10)

                } else {
                    Button(action: {
                        toggleCreateSheet.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .background(
                                Circle()
                                    .foregroundColor(.accentLightRed)
                            )
                            .padding(.leading, 10)
                    }
                }
            }
            .padding([.leading, .trailing], 20)
            .padding(.top, 30)
            .padding(.bottom, isListView ? 15 : 30)
            .clipShape(
                !isListView
                    ? AnyShape(RoundedRectangle(cornerRadius: roundedRadius))
                    : AnyShape(Rectangle())
            )
            .foregroundColor(.white)
            .contentShape(Rectangle())
            .onTapGesture {
                if items.isEmpty { return }
                withAnimation(.easeInOut(duration: 0.2)) {
                    isListView.toggle()
                }
            }

            if isListView {
                ExpenseList(expenses: items)
                    .padding([.leading, .trailing, .bottom], 3)
            }
        }
        .background(isListView ? Color.accentLightRed : Color.accentRed)
        .clipShape(RoundedRectangle(cornerRadius: roundedRadius))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onChange(of: items) {
            if items.isEmpty {
                isListView = false
            }
        }
        .sheet(isPresented: $toggleCreateSheet) {
            CreatorSheet(category: self.category)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }
}
