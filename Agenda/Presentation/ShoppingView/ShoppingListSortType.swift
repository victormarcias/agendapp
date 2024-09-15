//
//  ShoppingListSortType.swift
//  Agenda
//
//  Created by Victor Marcias on 15/09/2024.
//

import Foundation

enum ShoppingListSortType {
    case selectionUncategorized
    case selectionGrouped
}

extension Array where Element == ShoppingItem {
    
    func sorted(by sortType: ShoppingListSortType) -> [ShoppingCategory: [ShoppingItem]] {
        switch sortType {
        case .selectionUncategorized:
            return sortedBySelectionAndTitleUncategorized()
        default:
            return [:]
        }
    }
    
    private func sortedBySelectionAndTitleUncategorized() -> [ShoppingCategory: [ShoppingItem]] {
        let sorted = self.sorted { $0.title < $1.title }
        return [
            .pending: sorted.filter { !$0.isSelected },
            .basket: sorted.filter { $0.isSelected }
        ]
    }
}
