//
//  ShoppingListActionMenu.swift
//  Agenda
//
//  Created by Victor Marcias on 17/09/2024.
//

import SwiftUI

struct ShoppingListSettingsView: View {
    @ObservedObject private var viewModel = ShoppingListSettingsViewModel()
    private var settingChanged: () -> ()
    
    init(_ onChange: @escaping () -> ()) {
        self.settingChanged = onChange
    }
    
    var body: some View {
        Menu {
            ForEach(viewModel.groups, id: \.self) { group in
                Section {
                    ForEach(group, id:\.self) { setting in
                        Button(
                            role: setting.role,
                            action: {
                                viewModel.selectOption(setting)
                                settingChanged()
                            },
                            label: {
                                HStack {
                                    Image(systemName: setting.icon)
                                        .resizable()
                                        .frame(width: 22, height: 22)
                                    Text(setting.title)
                                }
                            })
                    }
                }
            }
        } label: {
            Image(systemName: "gearshape")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.accentColor)
        }
    }
}

// MARK: - Previews
#Preview {
    ShoppingListSettingsView({})
        .padding()
        .devicelessPreview()
}
