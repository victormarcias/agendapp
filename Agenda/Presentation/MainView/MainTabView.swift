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
        TabView(selection: $selection.onUpdate {
            NotificationCenter.default.post(Notification(name: selection.scrollToTopEvent.name))
        }) {
            CalendarView()
                .tabNavigationViewStyle(.calendar, isSelected: selection == .calendar)
            ShoppingListView()
                .tabNavigationViewStyle(.shopping, isSelected: selection == .shopping)
            TaskView()
                .tabNavigationViewStyle(.tasks, isSelected: selection == .tasks)
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

// MARK: - TabItemTap
private extension Binding {
    func onUpdate(_ closure: @escaping () -> Void) -> Binding<Value> {
        Binding(get: {
            wrappedValue
        }, set: { newValue in
            wrappedValue = newValue
            closure()
        })
    }
}

// MARK: - Preview
#Preview {
    MainTabView(selection: .calendar)
}
