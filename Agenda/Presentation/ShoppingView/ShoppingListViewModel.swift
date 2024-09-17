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
    private var storage = Storage()

    init() {
        loadStoredItems()
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
    
    private func loadStoredItems() {
        // Cargar los items desde UserDefaults
        items = storage.object(for: .shoppingItems) ?? []
        
        if let categories: [Bool] = storage.object(for: .shoppingToggles) {
            categoryToggles = categories
        }
        
        // Sino el Template
        guard items.isEmpty else { return }
        items = loadTemplateItems(from: "CartTemplate") ?? []
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
