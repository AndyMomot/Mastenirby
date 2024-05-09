//
//  InputFieldView.swift
//  Maximidriveup
//
//  Created by Andrii Momot on 26.04.2024.
//

import SwiftUI

struct InputFieldView: View {
    var title: String?
    var rightImage: String?
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
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5),
                            lineWidth: 2)
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(height: 44)
                
                HStack(spacing: 8) {
                    TextField(text: $text) {}
                        .foregroundColor(.black)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                    
                    if let imageName = rightImage, let image = UIImage(named: imageName) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 26)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct InputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputFieldView(title: "Имя",
                       rightImage: Asset.starYellow.name,
                       text: .constant("Имя"))
    }
}
