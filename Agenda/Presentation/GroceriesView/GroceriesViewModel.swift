//
//  GroceriesViewModel.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import Combine
import Foundation

final class GroceriesViewModel: ObservableObject {
    @Published var items: [GroceryItem] = []
    
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
        if let data = UserDefaults.standard.data(forKey: "cartItems"),
           let decoded = try? JSONDecoder().decode([GroceryItem].self, from: data) {
            self.items = decoded
            return
        }
        
        // Sino el Template
        // Uso de la función para cargar el archivo JSON
        if let items = loadTemplateItems(from: "Groceries") {
            self.items = items
        }
    }
    
    private func saveItems() {
        // Guardar los items en UserDefaults
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "cartItems")
        }
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
