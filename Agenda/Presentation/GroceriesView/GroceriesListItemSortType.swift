//
//  GroceriesListItemSortType.swift
//  Agenda
//
//  Created by Victor Marcias on 15/09/2024.
//

import Foundation

enum GroceriesListItemSortType {
    case selectionUncategorized
}

extension Array where Element == GroceryItem {
    
    func sorted(by sortType: GroceriesListItemSortType) -> [String: [GroceryItem]] {
        switch sortType {
        case .selectionUncategorized:
            return sortedBySelectionAndTitleUncategorized()
        }
    }
    
    private func sortedBySelectionAndTitleUncategorized() -> [String: [GroceryItem]] {
        ["All": self.sorted {
            if $0.isSelected == $1.isSelected {
                return $0.title < $1.title
            }
            return !$0.isSelected && $1.isSelected
        }]
    }
}
