//
//  TaskView.swift
//  Agenda
//
//  Created by Victor Marcias on 13/08/2024.
//

import SwiftUI

struct TaskView: View {
    @ObservedObject var viewModel = TaskViewModel()
    
    var body: some View {
        List(viewModel.items) { item in
            Text(item.title)
        }
    }
}
