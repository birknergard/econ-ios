//
//  ContentView.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 22/09/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                ExpensesView()
            }.tabItem {
                Text("Expenses")
                Image(systemName: "minus.square")
            }

            NavigationStack {
                HomeView()
            }
            .tabItem {
                Text("Home")
                Image(systemName: "house")
            }

            NavigationStack {
                IncomesView()
            }
            .tabItem {
                Text("Incomes")
                Image(systemName: "plus.square")
            }
        }
        .tint(.accentGreen)
    }
}
