//
//  CreationSheet.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 29/09/2025.
//

import SwiftUI

struct IncomeSheet: View {

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var store: EconStore

    var start: Income?
    @State private var name: String
    @State private var amount: Double

    @State private var createdMessage: String?

    init(start: Income) {
        self.start = start
        _name = State(initialValue: start.name)
        _amount = State(initialValue: start.amount)
    }

    init() {
        self.start = nil
        _name = State(initialValue: "")
        _amount = State(initialValue: 0)
    }

    func getVerifiedIncome() -> Income? {
        if name.isEmpty {
            print("invalid name")
            return nil
        }
        if amount <= 0 {
            print("invalid cost")
            return nil
        }

        return Income(
            name: name,
            amount: amount,
        )
    }

    func addIncome() {
        let new = getVerifiedIncome()
        if new != nil {
            store.add(new: new!)
        }
        reset()
    }

    func editIncome() {
        if start == nil { return }
        let new = getVerifiedIncome()
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

                Section {
                    HStack(alignment: .center) {
                        Spacer()

                        Button(action: {
                            start != nil ? editIncome() : addIncome()
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
