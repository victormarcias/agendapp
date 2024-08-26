//
//  CartItem.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import Foundation

typealias CartList = [String: [CartItem]]

struct CartItem: Identifiable, Codable {
    let id: UUID
    let title: String
    let emoji: String
    let isChecked: Bool
    
    init(id: UUID = UUID(), title: String, emoji: String, isChecked: Bool = false) {
        self.id = id
        self.title = title
        self.emoji = emoji
        self.isChecked = isChecked
    }
    
    // Este init permite la creación manual sin pasar el id para compatibilidad con JSON
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        self.title = try container.decode(String.self, forKey: .title)
        self.emoji = try container.decode(String.self, forKey: .emoji)
        self.isChecked = try container.decodeIfPresent(Bool.self, forKey: .isChecked) ?? false
    }
}
