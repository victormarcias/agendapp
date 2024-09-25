//
//  ShoppingListItemView.swift
//  Agenda
//
//  Created by Victor Marcias on 25/08/2024.
//

import SwiftUI

struct ShoppingListItemView: View {
    let item: ShoppingItem
    var action: () -> Void
    
    typealias TapAction = () -> Void
    
    init(item: ShoppingItem, _ action: TapAction? = nil) {
        self.item = item
        self.action = action ?? {}
    }
    
    var body: some View {
        Button(action: action, label: {
            HStack(alignment: .center, spacing: 10) {
                Text(item.emoji)
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                    .opacity(item.isSelected ? 0.80 : 1.00)
                Text(item.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .fixedSize(horizontal: false, vertical: false)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                Spacer()
                CheckmarkView(size: 20, isChecked: item.isSelected)
                    .padding(.trailing, 4)
                    .opacity(0.70)
            }
            .contentShape(Rectangle())
            .frame(height: 55)
            .frame(maxWidth: 340)
            .padding(.horizontal, 16)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.tertiary, lineWidth: 1)
            }
        })
        .onPressScale(0.95)
    }
}

// MARK: - Previews
#Preview {
    VStack {
        ShoppingListItemView(item: .init(
            title: "Manzana",
            emoji: "🍎",
            isChecked: false)
        )
        ShoppingListItemView(item: .init(
            title: "Detergente para vidrios que tambien limpia pisos",
            emoji: "🧺",
            isChecked: true)
        )
        ShoppingListItemView(item: .init(
            title: "Detergente para vidrios que tambien limpia pisos",
            emoji: "🧼",
            isChecked: false)
        )
    }
    .padding()
}
