//
//  ExpenseCreator.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 22/09/2025.
//

import SwiftData
import SwiftUI

struct CreateExpenseView: View {

    @EnvironmentObject var store: EconStore
    @Environment(\.presentationMode) var presentationMode

    // For POST
    @State var name: String = ""
    @State var cost: Double = 0.00
    @State var category: String = ""

    var body: some View {
        // For POST
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
                        Button(action: {
                            Task {
                                await store.createExpense(expense: Expense(
                                    id: "ios-test",
                                    name: name,
                                    cost: cost,
                                    category: category.lowercased()
                                ))
                            }
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack {
                                Image(systemName: "plus.square.dashed")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                Text("CREATE")
                            }
                        }

                        /*
                        Spacer()

                        Button(action: {
                        }) {
                            HStack {
                                Image(systemName: "xmark.bin")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                Text("CANCEL")
                            }
                        }
                         */
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.red)
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Create new expense")
        }
    }
}

#Preview {
    CreateExpenseView()
}
