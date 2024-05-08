//
//  TabBar.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct TabBar: View {
    @StateObject private var viewModel = TabBarViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $viewModel.selection) {
                HomeView()
                    .tag(TabBarSelectionView.home.rawValue)
                    .environmentObject(viewModel)
                
                AdviceView()
                    .tag(TabBarSelectionView.advice.rawValue)
                    .environmentObject(viewModel)
                
                ChallengesView()
                    .tag(TabBarSelectionView.сhallenges.rawValue)
                    .environmentObject(viewModel)
                
                AssetsView()
                    .tag(TabBarSelectionView.assets.rawValue)
                    .environmentObject(viewModel)
                
                AnalyzesView()
                    .tag(TabBarSelectionView.analyzes.rawValue)
                    .environmentObject(viewModel)
            }
            .tableStyle(.inset)
            .overlay(alignment: .bottom) {
                TabBarView(selectedItem: $viewModel.selection)
            }
            .padding(.bottom, -geometry.safeAreaInsets.bottom)
        }
    }
}

#Preview {
    TabBar()
}
