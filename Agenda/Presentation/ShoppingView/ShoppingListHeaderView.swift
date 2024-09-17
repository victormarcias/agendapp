//
//  ShoppingListHeaderView.swift
//  Agenda
//
//  Created by Victor Marcias on 15/09/2024.
//

import SwiftUI

struct ShoppingListHeaderView: View {
    var title: String
    var numberOfItems: Int
    var isExpanded: Bool
    var badgeColor: Color
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .opacity(0.75)
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .circular)
                    .frame(width: 35, height: 22)
                    .foregroundColor(badgeColor)
                    .opacity(0.8)
                Text(String(describing: numberOfItems))
                    .foregroundColor(.white)
                    .font(.footnote)
                    .bold()
            }
            .frame(height: 44)
            
            Spacer()
            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.accentColor)
                .opacity(0.6)
        }
        .contentShape(Rectangle())
        .padding(.horizontal, 20)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.primary, lineWidth: 1.5)
        }
    }
}

// MARK: - Previews
struct ShoppingListHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            ShoppingListHeaderView(title: "Pendientes",
                                   numberOfItems: 7,
                                   isExpanded: false,
                                   badgeColor: .red)
            ShoppingListHeaderView(title: "Frutas y Verduras",
                                   numberOfItems: 7,
                                   isExpanded: true,
                                   badgeColor: .orange)
            ShoppingListHeaderView(title: "Lista",
                                   numberOfItems: 7,
                                   isExpanded: true,
                                   badgeColor: .gray)
        }
        .padding()
        .devicelessPreview()
    }
}
