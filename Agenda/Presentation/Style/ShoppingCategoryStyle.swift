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
        case .cooking: return "Cocina"
        case .drinks: return "Bebidas"
        case .fruits: return "Frutas y verduras"
        case .higiene: return "Higiene"
        case .house: return "Hogar y limpieza"
        case .cart: return "Lista"
        }
    }
    
    func badgeColor(_ itemCount: Int = 0) -> Color {
        switch self {
        case .pending:
            return itemCount > 0 ? .red : .green
        case .cooking, .drinks, .fruits, .higiene, .house:
            return .gray
        case .cart:
            return .gray
        }
    }
    
    var headerHeight: Double {
        self == .pending ? 60 : 44
    }
}
