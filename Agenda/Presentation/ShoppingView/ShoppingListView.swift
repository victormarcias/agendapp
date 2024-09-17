//
//  ShoppingListView.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import SwiftUI

struct ShoppingListView: View {
    @ObservedObject var viewModel = ShoppingListViewModel()
    @State var isExpanded: [Bool] = Array(repeating: true, count: ShoppingCategory.allCases.count)
    
    private static var scrollTopId = "scrollTopId"
    
    private var groups: [ShoppingCategory: [ShoppingItem]] {
        viewModel.sortedItems
    }
    
    var body: some View {
        ScrollViewReader { reader in
            ScrollView {
                LazyVGrid(columns: [GridItem()], spacing: 10) {
                    ForEach(Array(groups.keys)
                        .sorted(by: { $0.rawValue < $1.rawValue }), id:\.rawValue) { key in
                            
                            Section {
                                ShoppingListHeaderView(
                                    title: key.title,
                                    numberOfItems: groups[key]?.count ?? 0,
                                    isExpanded: shouldShowCategory(key),
                                    badgeColor: key.badgeColor
                                ).onTapGesture {
                                    withAnimation {
                                        isExpanded[key.rawValue].toggle()
                                    }
                                }
                                
                                if let items = groups[key], shouldShowCategory(key) {
                                    ForEach(items) { item in
                                        ShoppingListItemView(item: item) {
                                            viewModel.selectItem(item)
                                        }
                                        .id(UUID())
                                    }
                                }
                            }
                        }
                }
                .padding(20)
            }
            .onReceive(NotificationCenter.default.publisher(for: TabItemType.shopping.scrollToTopEvent.name)) { _ in
                withAnimation {
                    reader.scrollTo(0, anchor: .top)
                }
            }
        }
    }
    
    private func shouldShowCategory(_ category: ShoppingCategory) -> Bool {
        isExpanded[category.rawValue]
    }
}
