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

    @State var selection: TabItemType = .groceries
    @State private var isTextVisible: Bool = false

    private var isSelected: Bool { selection == type }
    
    func body(content: Content) -> some View {
        content
            .tabItem {
                VStack {
                    Image(systemName: type.icon)
                        .font(.system(size: 24))
                    
                    if isTextVisible {
                        Text(type.title)
                            .font(.caption)
                            .transition(
                                .move(edge: .bottom)
                                .combined(with: .opacity)
                            )
                            .animation(.spring(
                                response: 0.4,
                                dampingFraction: 0.6,
                                blendDuration: 0
                            ), value: isTextVisible)
                    }
                }
                .onChange(of: isSelected) { selected in
                    withAnimation {
                        isTextVisible = selected
                    }
                }
            }
            .tag(type)
    }
}

extension View {
    func tabItemStyle(_ type: TabItemType, selection: TabItemType) -> some View {
        modifier(TabItemViewModifier(type: type, selection: selection))
    }
}

// MARK: - Preview
#Preview {
    TabView {
        ForEach(TabItemType.allCases, id: \.self) { tab in
            Rectangle()
                .tabItemStyle(tab, selection: .groceries)
        }
    }
}
