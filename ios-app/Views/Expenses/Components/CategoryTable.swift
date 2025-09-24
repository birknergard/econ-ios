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

    @State var isListView: Bool = false;
    
    var body: some View {
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
                : Text(String(format: "%d,-", categoryTotal)))
                .font(.title)

            Button(action: {
                // Modal active/deactivate
            }) {
                Image(systemName: "chevron.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .padding(.leading, 10)
            }
            .buttonStyle(.plain)

        }
        .font(.title2)
        .padding([.leading, .trailing], 20)
        .padding([.bottom, .top], 50)
        .foregroundColor(.white)
        .background(Color.accentRed)
        .cornerRadius(8)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding([.leading, .trailing], 10)
        .onTapGesture {
            isListView.toggle()
        }
    }
}

#Preview {
    CategoryTable()
}
