//
//  ios_appApp.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 22/09/2025.
//

import SwiftUI
import SwiftData

@main
struct ios_appApp: App {
    @StateObject private var store = EconStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(store)
        }.modelContainer(for: [Expense.self, Income.self])
    }
}
