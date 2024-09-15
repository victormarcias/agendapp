//
//  GroceriesListItemView.swift
//  Agenda
//
//  Created by Victor Marcias on 25/08/2024.
//

import SwiftUI

struct GroceriesListItemView: View {
    let item: GroceryItem
    var action: () -> Void
    
    typealias TapAction = () -> Void
    
    init(item: GroceryItem, _ action: TapAction? = nil) {
        self.item = item
        self.action = action ?? {}
    }
    
    var body: some View {
        Button(action: action, label: {
            HStack(alignment: .center, spacing: 10) {
                Text(item.emoji)
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                Text(item.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .fixedSize(horizontal: false, vertical: false)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                Spacer()
                CheckmarkView(size: 20, isChecked: item.isSelected)
                    .padding(.trailing, 4)
            }
            .contentShape(Rectangle())
            .frame(height: 55)
            .frame(maxWidth: 340)
            .padding(.horizontal, 16)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.tertiary, lineWidth: 1)
            }
            .opacity(item.isSelected ? 0.50 : 1.00)
        })
        .onPressScale(0.95)
    }
}

// MARK: - Previews
#Preview {
    VStack {
        GroceriesListItemView(item: .init(
            title: "Manzana",
            emoji: "🍎",
            isChecked: false)
        )
        GroceriesListItemView(item: .init(
            title: "Detergente para vidrios que tambien limpia pisos",
            emoji: "🧺",
            isChecked: true)
        )
        GroceriesListItemView(item: .init(
            title: "Detergente para vidrios que tambien limpia pisos",
            emoji: "🧼",
            isChecked: false)
        )
    }
    .padding()
}
