//
//  GroceryCategory.swift
//  Agenda
//
//  Created by Victor Marcias on 15/09/2024.
//

import Foundation

enum ShoppingCategory: Int, CaseIterable {
    case pending = 0    // marcados para comprar
    case cooking = 1
    case drinks = 2
    case fruits = 3
    case higiene = 4
    case house = 5
    case cart         // lista general, siempre al final
}
