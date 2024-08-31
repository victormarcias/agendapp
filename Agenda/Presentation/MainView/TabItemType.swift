//
//  TabItemView.swift
//  Agenda
//
//  Created by Victor Marcias on 31/08/2024.
//

import Foundation
import SwiftUI

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
                        .transition(
                            .move(edge: .top)
                        )

                    if isSelected {
                        Text(type.title)
                            .font(.caption)
                            .transition(
                                .move(edge: .bottom)
                            )
                            .animation(.spring(
                                response: 0.4,
                                dampingFraction: 0.6,
                                blendDuration: 0
                            ), value: isSelected)
                    }
                }
            }
            .tag(type)
    }
}

extension View {
    func tabItemStyle(_ type: TabItemType, isSelected: Bool) -> some View {
        modifier(TabItemViewModifier(type: type, isSelected: isSelected))
    }
}

// MARK: - Preview
#Preview {
    HStack {
        ForEach(TabItemType.allCases, id: \.self) { tab in
            Rectangle()
                .tabItemStyle(tab, isSelected: false)
        }
    }
    .padding(.horizontal)
    .frame(height: 80)
}
