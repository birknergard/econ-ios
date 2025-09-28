//
//  ExpenseCreator.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 22/09/2025.
//

import SwiftData
import SwiftUI

struct CreatorSheet: View {
    @EnvironmentObject var store: EconStore
    @Environment(\.dismiss) private var dismiss
    
    var isEditing : Bool = false
    
    var oldExpense: EstimatedExpense? = nil

    @State var name: String = ""
    @State var cost: Double = 0.00
    @State var category: String = "housing"
    @State var createdMessage: String?

    func createExpense() {
        let new = EstimatedExpense(
            name: name,
            cost: cost,
            category: category
        )

        if store.addExpense(expense: new) {
            createdMessage =
                "Successfully created expense on category \(category)!"
            reset()
        } else {
            createdMessage = "Failed to create expense!"
        }
    }
    
    func editExpense() {
        let new = EstimatedExpense(
            name: name.lowercased(),
            cost: cost,
            category: category
        )
        if store.editExpense(oldExpense: oldExpense!, newExpense: new) {
            createdMessage =
                "Successfully edited expense!"
            reset()
        } else {
            createdMessage = "Failed to create expense!"
        }
    }
    
    func reset() {
        name = ""
        cost = 0
    }

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Name")) {
                    TextField("Enter a name ...", text: $name)
                        .keyboardType(.alphabet)
                }

                Section(header: Text("Cost (Monthly)")) {
                    TextField(
                        "0,00",
                        value: $cost,
                        formatter: NumberFormatter()
                    )
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
                }

                Section(header: Text("Category")) {
                    Picker(
                        "Select a Category",
                        selection: $category
                    ) {
                        ForEach(store.categories, id: \.self) { category in
                            Text(category)
                        }
                    }
                    .pickerStyle(.wheel).font(.title2)
                    .labelsHidden()  // Hides the label to reduce padding
                    .frame(maxWidth: .infinity, maxHeight: 100)
                }

                Section {
                    HStack(alignment: .center) {
                        Spacer()
                        
                        Button(action: {
                            isEditing ? editExpense() : createExpense()
                        }) {
                            HStack {
                                if isEditing {
                                    Image(systemName: "square.and.arrow.down")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                    Text("SAVE")
                                } else {
                                    Image(systemName: "plus.square")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                    Text("CREATE")
                                }
                            }
                        }
                        .foregroundColor(.green)

                        Spacer()
                        
                        Button(action: {
                            dismiss()
                        }) {
                            HStack {
                                Image(systemName: "x.square")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                Text("CANCEL")
                            }
                        }
                        .foregroundColor(.textDark)

                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                .scrollContentBackground(.hidden)

                if let message = createdMessage {
                    Text(message)
                        .foregroundColor(
                            message.contains("Failed") ? .red : .green
                        )
                }
            }
        }
    }
}
