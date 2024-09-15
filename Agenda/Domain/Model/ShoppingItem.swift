//
//  CartItem.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import Foundation

struct ShoppingItem: Identifiable, Codable {
    let id: UUID
    let category: Int
    let title: String
    let emoji: String
    var isSelected: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case category = "cat"
        case title
        case emoji
        case isSelected
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
        self.isSelected = isChecked
    }
    
    // Este init permite la creación manual sin pasar el id para compatibilidad con JSON
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        self.category = try container.decode(Int.self, forKey: .category)
        self.title = try container.decode(String.self, forKey: .title)
        self.emoji = try container.decode(String.self, forKey: .emoji)
        self.isSelected = try container.decodeIfPresent(Bool.self, forKey: .isSelected) ?? true
    }
    
    mutating func toggle() {
        isSelected = !isSelected
    }
}
