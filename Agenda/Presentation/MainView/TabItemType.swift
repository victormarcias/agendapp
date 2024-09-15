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
    case calendar, shopping, tasks
    
    var title: String {
        switch self {
        case .calendar: return "Calendario"
        case .shopping: return "Compras"
        case .tasks: return "Tareas"
        }
    }
    
    var icon: String {
        switch self {
        case .calendar: return "calendar"
        case .shopping: return "cart"
        case .tasks: return "checklist"
        }
    }
    
    var scrollToTopEvent: NSNotification {
        NSNotification(name: .init("ScrollToTop\(rawValue)"), object: nil)
    }
}

// MARK: - ViewModifier
private struct TabItemViewModifier: ViewModifier {
    var type: TabItemType
    @State var isSelected: Bool = false
    
    func body(content: Content) -> some View {
        content
            .tabItem {
                Button(action: {
                    // nothing to do
                }, label: {
                    Image(systemName: type.icon)
                        .font(.system(size: 24))
                    Text(type.title)
                        .font(.caption)
                })
                .contentShape(Rectangle())
            }
            .tag(type)
    }
}

extension View {
    func tabItemStyle(_ type: TabItemType, isSelected: Bool) -> some View {
        modifier(TabItemViewModifier(type: type, isSelected: isSelected))
    }
}
