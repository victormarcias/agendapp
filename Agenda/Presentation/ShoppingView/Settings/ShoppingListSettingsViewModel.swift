//
//  ShoppingListActionMenuViewModel.swift
//  Agenda
//
//  Created by Victor Marcias on 17/09/2024.
//

import SwiftUI

enum ShoppingListSetting: CaseIterable {
    case categoriesOff
    case categoriesOn
    case resetSelection

    var title: String {
        switch self {
        case .categoriesOff:
            "Lista"
        case .categoriesOn:
            "Categorías"
        case .resetSelection:
            "Reestablecer"
        }
    }
    
    var icon: String {
        switch self {
        case .categoriesOn: "star.square.on.square"
        case .categoriesOff: "list.bullet"
        case .resetSelection: "restart"
        }
    }
    
    var role: ButtonRole {
        switch self {
        case .categoriesOn: return .cancel
        case .categoriesOff: return .cancel
        case .resetSelection: return .destructive
        }
    }
}

final class ShoppingListSettingsViewModel: ObservableObject {
    private var storage = Storage()
    
    var groups: [[ShoppingListSetting]] {
        [[.categoriesOn, .categoriesOff], [.resetSelection]]
    }
    
    func selectOption(_ option: ShoppingListSetting) {
        switch option {
        case .categoriesOff:
            storage.save(false, for: .shoppingCategories)
        case .categoriesOn:
            storage.save(true, for: .shoppingCategories)
        case .resetSelection:
            storage.erase(.shoppingItems)
            storage.save(false, for: .shoppingCategories)
        }
    }
}
