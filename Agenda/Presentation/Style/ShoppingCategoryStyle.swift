//
//  ShoppingCategoryStyle.swift
//  Agenda
//
//  Created by Victor Marcias on 17/09/2024.
//

import SwiftUI

extension ShoppingCategory {
    
    var title: String {
        switch self {
        case .pending: return "Pendientes"
        case .food: return "Comida"
        case .fruits: return "Frutas y Vegetales"
        case .cleaning: return "Limpieza"
        case .higiene: return "Higiene"
        case .house: return "Hogar"
        case .basket: return "Lista"
        }
    }
    
    var badgeColor: Color {
        switch self {
        case .pending:
            return .red
        case .food, .fruits, .cleaning, .higiene, .house:
            return .orange
        case .basket:
            return .gray
        }
    }
}
