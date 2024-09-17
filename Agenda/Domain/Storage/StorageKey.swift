//
//  StorageKey.swift
//  Agenda
//
//  Created by Victor Marcias on 01/09/2024.
//

import Foundation

// MARK: - Storage Keys
enum StorageKey: String, CaseIterable {
    /// Calendar
    case calendarItems = "calendar.items"
    /// Shopping
    case shoppingItems = "shopping.items"
    case shoppingToggles = "shopping.category.toggles"
    case shoppingCategories = "shopping.categories.on"
    /// Tasks
    case taskItems = "tasks.cartItems"

    var value: String { rawValue }
}
