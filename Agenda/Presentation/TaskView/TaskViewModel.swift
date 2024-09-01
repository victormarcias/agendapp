//
//  TaskViewModel.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import Combine
import Foundation

final class TaskViewModel: ObservableObject {
    @Published var items: [TaskItem] = []
    private var storage = Storage()
    
    init() {
        loadItems()
    }
    
    private func loadItems() {
        // Cargar los items desde UserDefaults
        items = storage.object(for: .taskItems) ?? []
    }
    
    private func saveItems() {
        // Guardar los items en UserDefaults
        storage.save(items, for: .taskItems)
    }
}
