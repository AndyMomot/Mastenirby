//
//  CustomAlert.swift
//  Mastenirby
//
//  Created by Andrii Momot on 07.05.2024.
//

import SwiftUI

struct CustomAlert: View {
    var title: String
    var message: String
    var okTitle: String?
    var cancelTitle: String
    var onOkay: (() -> Void)?
    var onCancel: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(title)
                    .foregroundStyle(Colors.greenCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 20))
                Spacer()
            }
            
            Text(message)
                .foregroundStyle(.black)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 15))
                .multilineTextAlignment(.leading)
            
            HStack(spacing: 20) {
                if okTitle != nil || okTitle?.isEmpty == false  {
                    NextButtonView(title: "Usuwać",
                                   color: Colors.redCustom.swiftUIColor) {
                        onOkay?()
                    }
                }
                
                NextButtonView(title: "Ratować") {
                    onCancel()
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10, corners: .allCorners)
        
    }
}

#Preview {
    ZStack {
        Color.gray
        CustomAlert(
            title: "Usuwać ?",
            message: "Czy na pewno chcesz usunąć ten cel?",
            okTitle: "Usuwać",
            cancelTitle: "Ratować",
            onOkay: {
                
            },
            onCancel: {
                
            })
        .padding()
    }
}
