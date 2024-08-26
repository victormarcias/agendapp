//
//  GroceriesItemView.swift
//  Agenda
//
//  Created by Victor Marcias on 25/08/2024.
//

import SwiftUI

struct GroceriesItemView: View {
    let item: CartItem
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(item.emoji)
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
            Text(item.title)
                .font(.footnote)
                .fixedSize(horizontal: false, vertical: true)
                .minimumScaleFactor(0.60)
                .lineLimit(2)
            Spacer()
        }
        .frame(maxWidth: 80, maxHeight: 60)
        .padding(EdgeInsets(top: 30, leading: 6, bottom: 12, trailing: 6))
        .overlay(
            CheckmarkView(size: 15, isChecked: item.isChecked)
                .opacity(item.isChecked ? 1 : 0)
                .padding(6), alignment: .topTrailing
        )
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.tertiary, lineWidth: 1)
        }
        .opacity(item.isChecked ? 0.75 : 1.00)
    }
}

// MARK: - Previews
#Preview {
    HStack(spacing: 20) {
        GroceriesItemView(item: .init(title: "Papel higiénico", emoji: "🧻"))
        GroceriesItemView(item: .init(title: "Desinfectante", emoji: "🧴", isChecked: true))
    }
    .previewDevice(.none)
    .previewLayout(.sizeThatFits)
}
