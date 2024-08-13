//
//  CartView.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel = CartViewModel()
    
    var body: some View {
        List {
            Section(header: Text("Unchecked")) {
                ForEach(viewModel.uncheckedItems) { item in
                    HStack {
                        Image(systemName: item.isChecked ? "checkmark.circle" : "circle")
                        Text(item.title)
                        Spacer()
                        Text(item.emoji)
                    }
                    .onTapGesture {
                        viewModel.toggleCheck(for: item)
                    }
                }
            }
            Section(header: Text("Checked")) {
                ForEach(viewModel.checkedItems) { item in
                    HStack {
                        Image(systemName: item.isChecked ? "checkmark.circle" : "circle")
                        Text(item.title)
                        Spacer()
                        Text(item.emoji)
                    }
                    .onTapGesture {
                        viewModel.toggleCheck(for: item)
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}
