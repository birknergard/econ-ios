//
//  ExpenseCreationSheet.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 30/09/2025.
//

import SwiftUI

struct ExpenseSheet: View {

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var store: EconStore

    var start: EstimatedExpense?
    @State private var name: String
    @State private var amount: Double
    @State private var category: String

    @State private var createdMessage: String?

    init(start: EstimatedExpense) {
        self.start = start
        _name = State(initialValue: start.name)
        _amount = State(initialValue: start.amount)
        _category = State(initialValue: start.category)
    }

    init(forCategory: String) {
        self.start = nil
        _name = State(initialValue: "")
        _amount = State(initialValue: 0)
        _category = State(initialValue: forCategory)
    }

    init() {
        self.start = nil
        _name = State(initialValue: "")
        _amount = State(initialValue: 0)
        _category = State(initialValue: "housing")
    }

    func getVerifiedExpense() -> EstimatedExpense? {
        if name.isEmpty {
            print("invalid name")
            return nil
        }
        if amount <= 0 {
            print("invalid cost")
            return nil
        }

        return EstimatedExpense(
            name: name,
            amount: amount,
            category: category
        )
    }

    func addExpense() {
        let new = getVerifiedExpense()
        if new != nil {
            store.add(new: new!)
        }
        reset()
    }

    func editExpense() {
        if start == nil { return }
        let new = getVerifiedExpense()
        if new != nil {
            store.edit(old: start!, new: new!)
        }
        dismiss()
    }

    func reset() {
        name = ""
        amount = 0.00
    }

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Name")) {
                    TextField("Enter a name ...", text: $name)
                        .keyboardType(.alphabet)
                }

                Section(header: Text("Amount (NOK)")) {
                    TextField(
                        "0,00",
                        value: $amount,
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
                        ForEach(
                            store.categories,
                            id: \.self
                        ) { category in
                            Text(category.capitalized)
                        }
                    }
                    .pickerStyle(.menu).font(.title2)
                    .labelsHidden()  // Hides the label to reduce padding
                    .frame(maxWidth: .infinity, maxHeight: 100)
                }

                Section {
                    HStack(alignment: .center) {
                        Spacer()

                        Button(action: {
                            start != nil ? editExpense() : addExpense()
                        }) {
                            HStack {
                                if start != nil {
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
