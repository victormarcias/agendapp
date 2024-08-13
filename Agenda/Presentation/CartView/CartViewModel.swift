//
//  CartViewModel.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import Combine
import Foundation

class CartViewModel: ObservableObject {
    @Published var items: [CartItem] = []
    
    var uncheckedItems: [CartItem] {
        items.filter { !$0.isChecked }
    }
    
    var checkedItems: [CartItem] {
        items.filter { $0.isChecked }
    }
    
    init() {
        loadItems()
    }
    
    func toggleCheck(for item: CartItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isChecked.toggle()
            saveItems()
        }
    }
    
    private func loadItems() {
        // Cargar los items desde UserDefaults
        if let data = UserDefaults.standard.data(forKey: "cartItems"),
           let decoded = try? JSONDecoder().decode([CartItem].self, from: data) {
            self.items = decoded
        }
    }
    
    private func saveItems() {
        // Guardar los items en UserDefaults
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "cartItems")
        }
    }
}
