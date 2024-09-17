//
//  GroceryCategory.swift
//  Agenda
//
//  Created by Victor Marcias on 15/09/2024.
//

import Foundation

enum ShoppingCategory: Int, CaseIterable {
    case pending = 0    // marcados para comprar
    case food = 1
    case fruits = 2
    case cleaning = 3
    case higiene = 4
    case house = 5
    case basket         // lista general, siempre al final
}
