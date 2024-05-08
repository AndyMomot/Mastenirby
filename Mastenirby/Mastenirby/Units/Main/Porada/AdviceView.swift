//
//  BudgetView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct AdviceView: View {
    @StateObject private var viewModel = AdviceViewModel()
    
    var body: some View {
        ZStack {
            Colors.background.swiftUIColor
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    // Top image
                    TopWallPaperView(title: "Budżet")
                    
                    // Advice items
                    ForEach(viewModel.adviсeItems) { item in
                        AdviceCell(item: item)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    AdviceView()
}
