//
//  CategoryList.swift
//  ios-app
//
//  Created by Birk Kristinius Nergård on 22/09/2025.
//

import SwiftUI

struct CategoryList: View {
    var store: EconStore
    
    var body: some View {
        List {
            ForEach(store.expenses, id: \.self ) { expense in
                
            }
        }
        .padding(.top, 5)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
