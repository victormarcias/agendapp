//
//  GroceriesViewModel.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import Combine
import Foundation

enum GroceriesLayoutType: Int { case grid, list }

final class GroceriesViewModel: ObservableObject {
    @Published var items: [GroceryItem] = []
    @Published var layoutType: GroceriesLayoutType = .list
    private var storage = Storage()

    var sortedItems: [GroceryItem] {
        items
            .sorted { $0.title < $1.title }
    }
    
    init() {
        loadStoredItems()
    }
    
    func selectItem(_ item: GroceryItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            var mutableItem = item
            mutableItem.toggle()
            items[index] = mutableItem
            saveItems()
        }
    }
    
    private func loadStoredItems() {
        // Cargar los items desde UserDefaults
        items = storage.object(for: .groceriesItems) ?? []
        layoutType = storage.enumValue(for: .groceriesLayout) ?? .list
        
        // Sino el Template
        guard items.isEmpty else { return }
        items = loadTemplateItems(from: "Groceries") ?? []
    }
    
    private func saveItems() {
        storage.save(items, for: .groceriesItems)
    }
}

// MARK: - Template
extension GroceriesViewModel {
    
    func loadTemplateItems(from fileName: String) -> [GroceryItem]? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("Archivo no encontrado")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let categories = try JSONDecoder().decode([String: [GroceryItem]].self, from: data)
            return categories["Template"]
        } catch {
            print("Error al decodificar JSON: \(error)")
            return nil
        }
    }
}
