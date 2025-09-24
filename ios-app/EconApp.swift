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
    @StateObject private var store: EconStore = EconStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }.modelContainer(for: [Expense.self, Income.self])
    }
}
