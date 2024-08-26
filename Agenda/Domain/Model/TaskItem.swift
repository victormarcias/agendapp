//
//  TaskItem.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import Foundation

struct TaskItem: Identifiable, Codable {
    var id = UUID()
    var title: String
}
