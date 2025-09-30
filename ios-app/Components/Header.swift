//
//  Header.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 29/09/2025.
//

import SwiftUI

struct Header: View {
    var displayedNumber: Double
    var subtitle: String
    var headerIcon: String = ""
    var accentColor: Color = .black
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.textDark)
            HStack {
                Image(systemName: headerIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text(String(format: "%.0f NOK", displayedNumber))
                    .font(.system(size: 50))
            }
            .foregroundColor(accentColor)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 15)
        .overlay(
            Rectangle()
                .frame(height: 0.2)
                .foregroundColor(.textDark),
            alignment: .bottom
        )
    }
}
