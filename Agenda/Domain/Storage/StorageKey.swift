//
//  StorageKey.swift
//  Agenda
//
//  Created by Victor Marcias on 01/09/2024.
//

import Foundation

// MARK: - Storage Keys
enum StorageKey: String, CaseIterable {
    case calendarItems = "calendar.items"
    case groceriesItems = "groceries.cartItems"
    case groceriesLayout = "groceries.layoutType"
    case taskItems = "tasks.cartItems"

    var value: String { rawValue }
}
