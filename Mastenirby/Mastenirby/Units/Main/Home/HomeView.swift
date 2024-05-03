//
//  HomeView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Colors.background.swiftUIColor
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 10) {
                        // Top image
                        TopWallPaperView(title: "Dom")
                        
                        // Events
                        
                        // Motivation
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 10),
                                            GridItem(.flexible(), spacing: 0)],
                                  spacing: 10) {
                            ForEach(viewModel.motivationItems) { item in
                                NavigationLink(value: item) {
                                    MotivationCell(item: item)
                                }
                            }
                        }
                                  .padding(.horizontal, 10)
                    }
                }
            }
            .navigationDestination(for: HomeView.MotivationItem.self) { item in
                MotivationDetailsView(item: item)
            }
        }
    }
}

#Preview {
    HomeView()
}
