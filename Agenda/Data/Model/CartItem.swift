//
//  CartItem.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import Foundation

struct CartItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isChecked: Bool = false
    var emoji: String
}
