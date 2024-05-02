//
//  RootContentView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct RootContentView: View {
    @StateObject private var viewModel = RootContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                PreloaderView()
            } else {
                Text("Hello, World!")
            }
        }
        .onAppear {
            viewModel.viewDidAppear()
        }
    }
}

#Preview {
    RootContentView()
}
