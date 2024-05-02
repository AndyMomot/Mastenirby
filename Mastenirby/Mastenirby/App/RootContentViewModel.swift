//
//  RootContentViewModel.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import Foundation

extension RootContentView {
    final class RootContentViewModel: ObservableObject {
        @Published var isLoading = true
        
        func viewDidAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.isLoading = false
            }
        }
    }
}
