//
//  PreloaderView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct PreloaderView: View {
    var body: some View {
        ZStack {
            Colors.background.swiftUIColor
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Asset.logoClearBackground.swiftUIImage
                    .padding(.top, 90)
                    .padding(.horizontal, 20)
                Spacer()
            }
        }
    }
}

#Preview {
    PreloaderView()
}
