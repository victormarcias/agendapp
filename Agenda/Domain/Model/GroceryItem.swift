//
//  CartItem.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import Foundation

struct GroceryItem: Identifiable, Codable {
    let id: UUID
    let category: Int
    let title: String
    let emoji: String
    var isChecked: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case category = "cat"
        case title
        case emoji
        case isChecked
    }
    
    init(id: UUID = UUID(),
         category: Int = 0,
         title: String,
         emoji: String,
         isChecked: Bool = true) {
        self.id = id
        self.category = category
        self.title = title
        self.emoji = emoji
        self.isChecked = isChecked
    }
    
    // Este init permite la creación manual sin pasar el id para compatibilidad con JSON
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        self.category = try container.decode(Int.self, forKey: .category)
        self.title = try container.decode(String.self, forKey: .title)
        self.emoji = try container.decode(String.self, forKey: .emoji)
        self.isChecked = try container.decodeIfPresent(Bool.self, forKey: .isChecked) ?? true
    }
    
    mutating func toggle() {
        isChecked = !isChecked
    }
}
