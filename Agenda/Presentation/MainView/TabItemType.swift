//
//  TabItemView.swift
//  Agenda
//
//  Created by Victor Marcias on 31/08/2024.
//

import Foundation
import SwiftUI

// MARK: - Type
enum TabItemType: Int, CaseIterable {
    case calendar, groceries, tasks
    
    var title: String {
        switch self {
        case .calendar: return "Calendario"
        case .groceries: return "Compras"
        case .tasks: return "Tareas"
        }
    }
    
    var icon: String {
        switch self {
        case .calendar: return "calendar"
        case .groceries: return "cart"
        case .tasks: return "checklist"
        }
    }
}

// MARK: - Modifier
private struct TabItemViewModifier: ViewModifier {
    var type: TabItemType

    @State var isSelected: Bool = false
    
    func body(content: Content) -> some View {
        content
            .tabItem {
                VStack(alignment: .center) {
                    Image(systemName: type.icon)
                        .font(.system(size: 24))
                    Text(type.title)
                        .font(.caption)
                }
                .jumpEffect(isActive: $isSelected)
            }
            .tag(type)
            .bounceEffect(isActive: $isSelected)
    }
}

extension View {
    func tabItemStyle(_ type: TabItemType, isSelected: Bool) -> some View {
        modifier(TabItemViewModifier(type: type, isSelected: isSelected))
    }
}
