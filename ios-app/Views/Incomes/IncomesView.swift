//
//  IncomesView.swift
//  ios
//
//  Created by Birk Kristinius Nergård on 17/09/2025.
//

import SwiftData
import SwiftUI

struct IncomesView: View {
    @EnvironmentObject var store: EconStore
    @Query var incomes: [Income]

    let headerSubtitle = "Total Income"

    @State var creating = false

    func enableCreationSheet() {
        creating = true
    }

    var body: some View {
        VStack(spacing: 0) {
            Header(
                displayedNumber: incomes.reduce(0.0) { $0 + $1.amount },
                subtitle: headerSubtitle,
                headerIcon: "plus",
                accentColor: .accentGreen
            )

            ListContainer(
                accentColor: .accentGreen,
                onButtonClick: enableCreationSheet
            ) {
                IncomeList(incomes: incomes)
            }

        }
        .sheet(isPresented: $creating) {
            IncomeSheet()
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }

    }
}
