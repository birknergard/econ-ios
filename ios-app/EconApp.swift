//
//  ios_appApp.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 22/09/2025.
//

import SwiftData
import SwiftUI

@main
struct EconApp: App {
    var body: some Scene {
        WindowGroup {
            StoreHandler()
        }.modelContainer(for: [EstimatedExpense.self, Income.self])
    }
}

struct StoreHandler: View {
    @Environment(\.modelContext) var context
    var body: some View {
        ContentView()
            .environmentObject(EconStore(context: context))
    }
}

