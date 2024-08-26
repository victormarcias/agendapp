//
//  GroceriesViewModel.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import Combine
import Foundation

final class GroceriesViewModel: ObservableObject {
    @Published var items: CartList = [:]
    
    // All items together
    var allItems: CartList {
        [
            "All": items
                .flatMap { $0.value }
                .sorted { $0.title < $1.title || $0.isChecked && !$1.isChecked }
        ]
    }
    
    // All items in Categories
    var categorizedItems: CartList {
        items
            .mapValues { items in
                items.sorted { $0.isChecked && !$1.isChecked }
            }
    }
    
    init() {
        loadItems()
    }
    
    func selectItem(_ item: CartItem) {
        
    }
//    func toggleCheck(for item: CartItem) {
//        if let index = items.firstIndex(where: { $0.id == item.id }) {
//            items[index].isChecked.toggle()
//            saveItems()
//        }
//    }
    
    private func loadItems() {
        // Cargar los items desde UserDefaults
        if let data = UserDefaults.standard.data(forKey: "cartItems"),
           let decoded = try? JSONDecoder().decode(CartList.self, from: data) {
            self.items = decoded
            return
        }
        
        // Sino el Template
        // Uso de la función para cargar el archivo JSON
        if let categories = loadCategories(from: "Groceries") {
            self.items = categories
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
    
    func loadCategories(from fileName: String) -> CartList? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("Archivo no encontrado")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let categories = try JSONDecoder().decode(CartList.self, from: data)
            return categories
        } catch {
            print("Error al decodificar JSON: \(error)")
            return nil
        }
    }
}
