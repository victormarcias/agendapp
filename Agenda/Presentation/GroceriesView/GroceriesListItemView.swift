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
                    .fixedSize(horizontal: true, vertical: true)
                Text(item.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .fixedSize(horizontal: true, vertical: false)
                    .minimumScaleFactor(0.70)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .contentShape(Rectangle())
            .frame(height: 55)
            .frame(maxWidth: 340)
            .padding(.horizontal, 20)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.tertiary, lineWidth: 1)
            }
            .overlay(
                CheckmarkView(size: 20, isChecked: item.isChecked)
                    .padding(.trailing, 20), alignment: .trailing
            )
            .opacity(item.isChecked ? 0.50 : 1.00)
        })
        .onPressScale(0.95)
    }
}

// MARK: - Previews
#Preview {
    VStack {
        GroceriesListItemView(item: .init(
            title: "Detergente para vidrios",
            emoji: "🪟",
            isChecked: false)
        )
        GroceriesListItemView(item: .init(
            title: "Desinfectante",
            emoji: "🧴")
        )
    }
    .padding()
}
