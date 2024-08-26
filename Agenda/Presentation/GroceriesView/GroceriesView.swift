//
//  GroceriesView.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import SwiftUI

struct GroceriesView: View {
    @ObservedObject var viewModel = GroceriesViewModel()
    
    private var list: CartList {
        viewModel.allItems
    }
    
    private var columnsGuide = [
        GridItem(.flexible(minimum: 30, maximum: 80)),
        GridItem(.flexible(minimum: 30, maximum: 80)),
        GridItem(.flexible(minimum: 30, maximum: 80)),
        GridItem(.flexible(minimum: 30, maximum: 80))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columnsGuide, spacing: 10) {
                ForEach(list.keys.sorted(), id: \.self) { key in
                    Section(header: Text(key).font(.headline)) {
                        if let items = list[key] {
                            ForEach(items) { item in
                                GroceriesItemView(item: item)
                            }
                        }
                    }
                }
            }
        }
    }
}
