//
//  GroceriesView.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import SwiftUI

struct GroceriesView: View {
    @ObservedObject var viewModel = GroceriesViewModel()
    @State var isExpanded: [Bool] = Array(repeating: true, count: GroceryCategory.allCases.count)
    
    private var groups: [GroceryCategory: [GroceryItem]] {
        viewModel.sortedItems
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()], spacing: 10) {
                ForEach(Array(groups.keys)
                    .sorted(by: { $0.rawValue < $1.rawValue }), id:\.rawValue) { key in
                        
                        Section {
                            GroceriesHeaderView(
                                title: key.title,
                                numberOfItems: groups[key]?.count ?? 0,
                                isExpanded: shouldShowCategory(key)
                            ).onTapGesture {
                                withAnimation {
                                    isExpanded[key.rawValue].toggle()
                                }
                            }
                        
                        if let items = groups[key], shouldShowCategory(key) {
                            ForEach(items) { item in
                                GroceriesListItemView(item: item) {
                                    viewModel.selectItem(item)
                                }
                            }
                        }
                    }
                }
            }
            .id(UUID())
            .padding(20)
        }
    }
    
    private func shouldShowCategory(_ category: GroceryCategory) -> Bool {
        isExpanded[category.rawValue]
    }
}
