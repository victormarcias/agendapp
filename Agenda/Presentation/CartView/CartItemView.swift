//
//  CartItemView.swift
//  Agenda
//
//  Created by Victor Marcias on 25/08/2024.
//

import SwiftUI

struct CartItemView: View {
    let item: CartItem
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Group {
                Text(item.emoji)
                    .font(.title)
                Text(item.title)
                    .font(.subheadline)
            }
            .multilineTextAlignment(.center)
            .foregroundColor(.primary)
        }
        .frame(width: 80, height: 100)
        .padding(4)
        .overlay(
            CheckmarkView(size: 15, isChecked: item.isChecked)
                .padding(6), alignment: .topTrailing
        )
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.tertiary, lineWidth: 2)
        }
    }
}

// MARK: - Previews
#Preview {
    HStack(spacing: 20) {
        CartItemView(item: .init(title: "Papel higiénico", emoji: "🧻"))
        CartItemView(item: .init(title: "Papel higiénico", isChecked: true, emoji: "🧻"))
    }
    .previewLayout(.sizeThatFits)
    .previewDevice(.none)
}
