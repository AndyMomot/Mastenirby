//
//  BudgetView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct BudgetView: View {
    @StateObject private var viewModel = BudgetViewModel()
    
    var body: some View {
        ZStack {
            Colors.background.swiftUIColor
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    // Top image
                    TopWallPaperView(title: "Budżet")
                }
            }
        }
    }
}

#Preview {
    BudgetView()
}
