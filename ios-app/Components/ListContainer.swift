//
//  Body.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 29/09/2025.
//

import SwiftUI

struct ListContainer<Content: View> : View {
    var accentColor: Color = .black
    let onButtonClick: () -> Void
    
    @ViewBuilder let content: Content
    var body: some View {
        ZStack() {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            Button(action: {
                onButtonClick()
            }) {
                Image(systemName: "document.badge.plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .background(Circle().fill(Color.white))
                    .foregroundColor(accentColor)
            }
            .buttonStyle(.plain)
            .background(
                Circle()
                    .fill(Color.white)
                    .frame(width: 65, height: 65)
                    .shadow(color: .gray.opacity(0.5), radius: 5)
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(30)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
        )
        .background(Color.background)
    }
}
