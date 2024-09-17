//
//  ShoppingListViewModel.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import Combine
import Foundation

final class ShoppingListViewModel: ObservableObject {
    
    @Published var items: [ShoppingItem] = []
    @Published var categoryToggles: [Bool] = Array(repeating: false,
                                                   count: ShoppingCategory.allCases.count)
    @Published var showCategories: Bool = false
    
    /// Storage
    private var storage = Storage()

    /// Init
    init() {
        loadViewState()
    }
    
    private func loadViewState() {
        // Load last selections
        items = storage.object(for: .shoppingItems) ?? []
        
        // Category toggles
        if let categories: [Bool] = storage.object(for: .shoppingToggles) {
            categoryToggles = categories
        }
        // Categories
        showCategories = storage.object(for: .shoppingCategories) ?? false
        
        // Load Card Template
        guard items.isEmpty else { return }
        items = loadTemplateItems(from: "CartTemplate") ?? []
    }
    
    func update() {
        loadViewState()
    }
    
    func selectItem(_ item: ShoppingItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            var mutableItem = item
            mutableItem.toggle()
            items[index] = mutableItem
            saveSelections()
        }
    }
    
    func toggleCategory(_ category: ShoppingCategory) {
        categoryToggles[category.rawValue].toggle()
        saveSelections()
    }
    
    private func saveSelections() {
        storage.save(categoryToggles, for: .shoppingToggles)
        storage.save(items, for: .shoppingItems)
    }
}

// MARK: - Template
extension ShoppingListViewModel {
    
    func loadTemplateItems(from fileName: String) -> [ShoppingItem]? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("Archivo no encontrado")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let categories = try JSONDecoder().decode([String: [ShoppingItem]].self, from: data)
            return categories["Template"]
        } catch {
            print("Error al decodificar JSON: \(error)")
            return nil
        }
    }
}
