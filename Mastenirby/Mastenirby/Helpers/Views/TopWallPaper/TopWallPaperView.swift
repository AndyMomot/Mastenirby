//
//  TopWallPaperView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 03.05.2024.
//

import SwiftUI

struct TopWallPaperView: View {
    var title: String?
    
    var body: some View {
        ZStack {
            Asset.homeTopIcon.swiftUIImage
                .resizable()
                .scaledToFit()
                .overlay {
                    if let title = title, !title.isEmpty {
                        VStack {
                            HStack {
                                
                                Text(title)
                                    .foregroundStyle(Colors.greenCustom.swiftUIColor)
                                    .font(Fonts.SFProDisplay.heavy.swiftUIFont(size: 22))
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                        }
                        .padding(.vertical)
                    }
                }
        }
    }
}

#Preview {
    TopWallPaperView(title: "Dom")
    
}
