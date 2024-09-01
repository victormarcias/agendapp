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
    private var storage = Storage()
    
    init() {
        loadItems()
    }
    
    private func loadItems() {
        // Cargar los items desde UserDefaults
        items = storage.object(for: .calendarItems) ?? []
    }
    
    private func saveItems() {
        // Guardar los items en UserDefaults
        storage.save(items, for: .calendarItems)
    }
}
