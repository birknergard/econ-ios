//
//  ExpenseCreator.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 22/09/2025.
//

import SwiftData
import SwiftUI

struct Creator: View {
    @EnvironmentObject var store: EconStore
    @Environment(\.presentationMode) var presentationMode
    var context: ModelContext
    
    init(context: ModelContext){
        self.context = context
    }

    @State var name: String = ""
    @State var cost: Double = 0.00
    @State var category: String = "housing"
    @State var createdMessage: String?

    func reset(){
        name = "";
        cost = 0;
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
                        Button(action: {
                            let new = Expense(
                                name: name,
                                cost: cost,
                                category: category
                            )
                            context.insert(new)
                            do {
                                try context.save()
                                createdMessage = "Successfully created expense on category \(category)!"
                                reset()
                            } catch {
                                createdMessage = "Failed to create expense!"
                            }
                            
                        }) {
                            HStack {
                                Image(systemName: "plus.square.dashed")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                Text("CREATE")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.red)
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Create new expense")
            
            if let message = createdMessage {
                Text(message)
                    .foregroundColor(message.contains("Failed") ? .red : .green)
            }
        }
    }
}
