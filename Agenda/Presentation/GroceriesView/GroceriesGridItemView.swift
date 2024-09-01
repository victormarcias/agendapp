//
//  GroceriesGridItemView.swift
//  Agenda
//
//  Created by Victor Marcias on 25/08/2024.
//

import SwiftUI

struct GroceriesGridItemView: View {
    let item: GroceryItem
    var action: () -> Void

    typealias TapAction = () -> Void

    init(item: GroceryItem, _ action: TapAction? = nil) {
        self.item = item
        self.action = action ?? {}
    }
    
    var body: some View {
        Button(action: action, label: {
            VStack(alignment: .center, spacing: 10) {
                Text(item.emoji)
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                Text(item.title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .fixedSize(horizontal: false, vertical: true)
                    .minimumScaleFactor(0.60)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .frame(maxWidth: 80, maxHeight: 60)
            .padding(EdgeInsets(top: 30, leading: 6, bottom: 12, trailing: 6))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.tertiary, lineWidth: 1)
            }
            .overlay(
                CheckmarkView(size: 12, isChecked: item.isChecked)
                    .padding(6), alignment: .topTrailing
            )
            .opacity(item.isChecked ? 0.50 : 1.00)
        })
        .onPressScale(0.95)
    }
}

// MARK: - Previews
#Preview {
    HStack(spacing: 20) {
        GroceriesGridItemView(item: .init(category: 0,
                                      title: "Detergente para vidrios",
                                      emoji: "🪟"))
        GroceriesGridItemView(item: .init(category: 1,
                                      title: "Desinfectante",
                                      emoji: "🧴",
                                      isChecked: true))
    }
    .previewDevice(.none)
    .previewLayout(.sizeThatFits)
}
