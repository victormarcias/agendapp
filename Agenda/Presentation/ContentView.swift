//
//  AgendaApp.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GroceriesView()
                .tabItem {
                    Label("Compras", systemImage: "cart")
                }
            CalendarView()
                .tabItem {
                    Label("Calendario", systemImage: "calendar")
                }
            TaskView()
                .tabItem {
                    Label("Tareas", systemImage: "checklist")
                }
        }
    }
}

#Preview {
    ContentView()
}
