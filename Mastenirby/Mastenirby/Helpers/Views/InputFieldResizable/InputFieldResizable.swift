//
//  InputFieldResizable.swift
//  Mastenirby
//
//  Created by Andrii Momot on 08.05.2024.
//

import SwiftUI

struct InputFieldResizable: View {
    var title: String?
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let title = title {
                HStack {
                    Text(title)
                        .foregroundColor(.black)
                        .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 14))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
            }
            
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
                    .background(Color.white)
                
                TextEditor(text: $text)
                    .foregroundColor(.black)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 17))
                    .padding(8)
                    .colorScheme(.light)
            }
        }
    }
}

#Preview {
    InputFieldResizable(title: "Opis",
                        text: .constant("Lorem ipsum dolor sit amet consectetur. Eget velit vitae nec dictum Massa Phasellus. Urna sem facilisis purus vitae sollicitudin praesent. Imperdiet vitae tellus aliquam porttitor justo. Enim at sed at duis adipiscing tellus ornare leo ut."))
    .frame(maxHeight: 150)
}
