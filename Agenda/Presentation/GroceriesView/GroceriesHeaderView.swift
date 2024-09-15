//
//  GroceriesHeaderView.swift
//  Agenda
//
//  Created by Victor Marcias on 15/09/2024.
//

import SwiftUI

struct GroceriesHeaderView: View {
    var title: String
    var numberOfItems: Int
    var isExpanded: Bool
    
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
                    .foregroundColor(Color.red)
                    .opacity(0.8)
                Text(String(describing: numberOfItems))
                    .foregroundColor(.white)
                    .font(.footnote)
                    .bold()
            }
            .frame(height: 60)
            
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
                .stroke(.primary, lineWidth: 2)
        }
    }
}

// MARK: - Previews
struct GroceriesHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            GroceriesHeaderView(title: "Frutas y Verduras", 
                                numberOfItems: 7,
                                isExpanded: true)
        }
        .padding()
        .devicelessPreview()
    }
}
