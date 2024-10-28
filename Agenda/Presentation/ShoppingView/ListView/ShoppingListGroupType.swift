//
//  ShoppingListGroupType.swift
//  Agenda
//
//  Created by Victor Marcias on 15/09/2024.
//

import Foundation

enum ShoppingListGroupType {
    case selectionUncategorized
    case selectionGrouped
}

extension Array where Element == ShoppingItem {
    
    func grouped(by sortType: ShoppingListGroupType) -> [ShoppingCategory: [ShoppingItem]] {
        switch sortType {
        case .selectionUncategorized:
            return sortedBySelectionAndTitleUncategorized()
        default:
            return sortedBySelectionCategorized()
        }
    }
    
    private func sortedBySelectionAndTitleUncategorized() -> [ShoppingCategory: [ShoppingItem]] {
        let sorted = sorted { $0.title < $1.title }
        return [
            .pending: sorted.filter { !$0.isSelected },
            .cart: sorted.filter { $0.isSelected }
        ]
    }
    
    private func sortedBySelectionCategorized() -> [ShoppingCategory: [ShoppingItem]] {
        let pending = filter { !$0.isSelected }.sorted { $0.title < $1.title }
        let list = filter { $0.isSelected }.sorted { $0.title < $1.title }
        
        return [
            .pending: pending,
            .cooking: list.filter { $0.category == ShoppingCategory.cooking.rawValue },
            .drinks: list.filter { $0.category == ShoppingCategory.drinks.rawValue },
            .fruits: list.filter { $0.category == ShoppingCategory.fruits.rawValue },
            .higiene: list.filter { $0.category == ShoppingCategory.higiene.rawValue },
            .house: list.filter { $0.category == ShoppingCategory.house.rawValue }
        ]
    }
}
