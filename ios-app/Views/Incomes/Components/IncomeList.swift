//
//  IncomeList.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 29/09/2025.
//

import SwiftUI

struct IncomeList: View {
    @EnvironmentObject private var store: EconStore
    let incomes: [Income]

    private let gap: CGFloat = 15
    var body: some View {
        VStack(spacing: gap) {
            ForEach(incomes, id: \.self) { income in
                IncomeItem(income: income)
            }
        }
        .padding(.top, gap)
        .padding([.leading, .trailing], 8)
    }
}
