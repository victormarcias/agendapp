//
//  CalendarViewModel.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import Combine
import Foundation

final class CalendarViewModel: ObservableObject {
    @Published var items: [CalendarItem] = []
    
    init() {
        loadItems()
    }
    
    private func loadItems() {
        // Cargar los items desde UserDefaults
        if let data = UserDefaults.standard.data(forKey: "calendarItems"),
           let decoded = try? JSONDecoder().decode([CalendarItem].self, from: data) {
            self.items = decoded
        }
    }
    
    private func saveItems() {
        // Guardar los items en UserDefaults
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "calendarItems")
        }
    }
}
