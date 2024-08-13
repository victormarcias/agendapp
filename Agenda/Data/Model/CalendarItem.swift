//
//  CalendarItem.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import Foundation

struct CalendarItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var date: Date
    var time: Date
}
