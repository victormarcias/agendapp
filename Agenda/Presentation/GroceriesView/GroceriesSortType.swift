//
//  GroceriesListItemSortType.swift
//  Agenda
//
//  Created by Victor Marcias on 15/09/2024.
//

import Foundation

enum GroceriesSortType {
    case selectionUncategorized
    case selectionGrouped
}

extension Array where Element == GroceryItem {
    
    func sorted(by sortType: GroceriesSortType) -> [GroceryCategory: [GroceryItem]] {
        switch sortType {
        case .selectionUncategorized:
            return sortedBySelectionAndTitleUncategorized()
        default:
            return [:]
        }
    }
    
    private func sortedBySelectionAndTitleUncategorized() -> [GroceryCategory: [GroceryItem]] {
        let sorted = self.sorted { $0.title < $1.title }
        return [
            .pending: sorted.filter { !$0.isSelected },
            .basket: sorted.filter { $0.isSelected }
        ]
    }
}
