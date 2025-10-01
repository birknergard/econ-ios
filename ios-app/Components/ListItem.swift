//
//  ListItem.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 29/09/2025.
//

import SwiftUI

struct ListItem: View {

    var name: String
    var amount: Double
    var onDelete: () -> Void
    var onEdit: () -> Void
    var color: Color = .black
    var large = false

    @State private var isOpen = false

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("\(name.capitalized)").font(.system(size: large ? 24 : 16))
                Image(systemName: "arrow.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: large ? 16 : 13, height: large ? 16 : 13)
                Text(String(format: "%.0f NOK", amount))
                    .font(.system(size: large ? 24 : 16 ))
                Spacer()
                if !isOpen {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                }
            }
            .foregroundColor(.white)
            .padding([.top, .bottom], large ? 20 : 10)
            .padding([.leading, .trailing], large ? 20 : 10)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isOpen.toggle()
                }
            }

            if isOpen {
                HStack(spacing: 0) {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .padding([.top, .bottom], 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .onTapGesture {
                            onEdit()
                        }

                    Image(systemName: "xmark.bin.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .padding([.top, .bottom], 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.textDark)
                        .onTapGesture {
                            onDelete()
                        }
                }
                .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity)
        .background(color)
        .clipShape(
            RoundedRectangle(cornerRadius: roundedRadius, style: .circular)
        )
        .shadow(radius: 2)
    }
}
