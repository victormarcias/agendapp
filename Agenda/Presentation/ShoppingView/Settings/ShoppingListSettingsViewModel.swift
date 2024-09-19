//
//  ShoppingListActionMenuViewModel.swift
//  Agenda
//
//  Created by Victor Marcias on 17/09/2024.
//

import Combine

enum ShoppingListSetting: CaseIterable {
    case categoriesOff
    case categoriesOn
    case resetSelection

    var title: String {
        switch self {
        case .categoriesOff:
            "Mostrar Lista"
        case .categoriesOn:
            "Mostrar Categorías"
        case .resetSelection:
            "Reestablecer Lista"
        }
    }
    
    var icon: String {
        switch self {
        case .categoriesOn: "star.square.on.square"
        case .categoriesOff: "list.bullet"
        case .resetSelection: "restart"
        }
    }
}

final class ShoppingListSettingsViewModel: ObservableObject {
    private var storage = Storage()
    
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
