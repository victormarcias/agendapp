//
//  MainTabViewModel.swift
//  Agenda
//
//  Created by Victor Marcias on 31/08/2024.
//

import Foundation

final class MainTabViewModel: ObservableObject {
    @Published var selectedTab: TabItemType?
    
    init() {
        loadPreferences()
    }
    
    private func loadPreferences() {
        let tab = UserDefaults.standard.integer(forKey: "selectedTab")
        selectedTab = .init(rawValue: tab) ?? .groceries
    }
    
    func savePreferences() {
        guard let selected = selectedTab?.rawValue else { return }
        UserDefaults.standard.setValue(selected, forKey: "selectedTab")
    }
}
