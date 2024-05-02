//
//  TabBarViewModel.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import Foundation

extension TabBar {
    final class TabBarViewModel: ObservableObject {
        @Published var selection = TabBarSelectionView.home.rawValue
    }
}

extension TabBar {
    enum TabBarSelectionView: Int {
        case home = 0
        case budget = 1
        case visas = 2
        case assets = 3
        case analyzes = 4
    }
    
    struct Item: Identifiable {
        private(set) var id = UUID()
        var image: String
        var selectedImage: String
        var title: String
    }
}
