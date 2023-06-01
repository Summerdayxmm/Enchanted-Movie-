//
//  CommentTextField.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/29.
//


import SwiftUI

struct CommendFieldModifier: ViewModifier {
    var icon: String
    
    func body(content: Content) -> some View {
        content
            .overlay(
                HStack {
                    Image(systemName: icon)
                        .frame(width: 36, height: 36)
                        .background(.thinMaterial)
                        .cornerRadius(14)
                        .modifier(OutlineOverlay(cornerRadius: 14))
                        .offset(x: 200)
                        .foregroundStyle(.secondary)
                        .accessibility(hidden: true)
                    Spacer()
                }
            )
            .foregroundStyle(.primary)
            .padding(15)
            .padding(.leading, 40)
            .background(.thinMaterial)
            .cornerRadius(20)
//            .modifier(OutlineOverlay(cornerRadius: 20))
    }
}

extension View {
    func CommendFieldModifier(icon: String) -> some View {
        self.modifier(TextFieldModifier(icon: icon))
    }
}
