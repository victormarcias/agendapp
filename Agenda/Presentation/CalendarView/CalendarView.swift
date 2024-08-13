//
//  CalendarView.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import SwiftUI

struct CalendarView: View {
    @ObservedObject var viewModel = CalendarViewModel()
    
    var body: some View {
        List(viewModel.items) { item in
            HStack {
                Text(item.title)
                Spacer()
                Text(item.date, style: .date)
                Text(item.time, style: .time)
            }
        }
    }
}
