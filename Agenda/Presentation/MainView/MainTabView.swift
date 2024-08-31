//
//  MainTabView.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var viewModel = MainTabViewModel()
    
    @State var selection: TabItemType
    
    var body: some View {
        TabView(selection: $selection) {
            CalendarView()
                .tabItemStyle(.calendar, isSelected: selection == .calendar)
            GroceriesView()
                .tabItemStyle(.groceries, isSelected: selection == .groceries)
            TaskView()
                .tabItemStyle(.tasks, isSelected: selection == .tasks)
        }
        .id(UUID())
        .onAppear {
            if let selected = viewModel.selectedTab {
                selection = selected
            }
        }
        .onChange(of: selection) { _ in
            viewModel.selectedTab = selection
            viewModel.savePreferences()
        }
    }
}

// MARK: - Preview
#Preview {
    MainTabView(selection: .calendar)
}
