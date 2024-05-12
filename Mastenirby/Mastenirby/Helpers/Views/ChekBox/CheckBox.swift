//
//  ChekBox.swift
//  Mastenirby
//
//  Created by Andrii Momot on 12.05.2024.
//

import SwiftUI

struct CheckBox: View {
    @Binding var isSelected: Bool
    
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.black)
                    .frame(width: 17, height: 17)
                
                if isSelected {
                    Circle()
                        .foregroundStyle(.black)
                        .frame(width: 12, height: 12)
                }
            }
        }

    }
}

#Preview {
    CheckBox(isSelected: .constant(true))
}
