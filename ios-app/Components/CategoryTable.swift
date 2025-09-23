//
//  CategoryTable.swift
//  ios
//
//  Created by Birk Kristinius Nergård on 17/09/2025.
//

import SwiftUI

struct CategoryTable: View {
    var title: String = "Unknown"
    var items: [Expense] = []
    var borderColor: Color = .gray
    var categoryTotal: Double = 0  // Test value

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(title)").font(.title2)
                
                if items.isEmpty || categoryTotal <= 0 {
                    Text("Category is empty.").font(.caption)
                } else {
                    Text("Contains \(items.count) entries.")
                }
            }

            Spacer()

            if items.isEmpty {
                Text("0,-").font(.title)
            } else {
                Text("\(String(format: "%.2f", categoryTotal)),-").font(
                    .title.bold()
                )
            }

            Button(action: {
                // Modal active/deactivate
            }) {
                Image(systemName: "chevron.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
            }
            .buttonStyle(.plain)

        }
        .font(.title2)
        .padding([.top, .bottom], 30)
        .padding([.leading, .trailing], 20)
        .foregroundColor(.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(8)
        .border(borderColor, width: 5)
    }
}

#Preview {
    CategoryTable()
}
