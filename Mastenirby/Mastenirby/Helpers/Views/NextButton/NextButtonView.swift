//
//  NextButtonView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 06.05.2024.
//

import SwiftUI

struct NextButtonView: View {
    var title: String
    var color = Colors.greenCustom.swiftUIColor
    var onTapped: () -> ()
    
    var body: some View {
        Button {
            onTapped()
        } label: {
            
            HStack(spacing: 5) {
                Spacer()
                
                Text(title)
                    .foregroundStyle(.white)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 15))
                    .padding(.vertical)
                
                Spacer()
            }
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 50))
        }
    }
}

#Preview {
    NextButtonView(title: "Z powrotem") {}
}
