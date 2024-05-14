//
//  AnalyzesView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct AnalyzesView: View {
    @StateObject private var viewModel = AnalyzesViewModelModel()
    
    var body: some View {
        ZStack {
            Colors.background.swiftUIColor
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    // Top image
                    TopWallPaperView(title: "Analityka")
                    
                    ChartView(
                        type: .day,
                        title: "Spędź tydzień na detoksie",
                        dataSource: viewModel.detoxCostsCurrentWeek
                    )
                    .padding()
                    
                    ChartView(
                        type: .month,
                        title: "Wydaj na detoks w ciągu miesiąca",
                        dataSource: viewModel.detoxCostsMonths
                    )
                    .padding()
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    AnalyzesView()
}
