//
//  PoradaCell.swift
//  Mastenirby
//
//  Created by Andrii Momot on 07.05.2024.
//

import SwiftUI

struct AdviceCell: View {
    var item: AdviceView.AdviceModel
    
    @State private var showDescription = false
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text(item.title)
                    .foregroundStyle(showDescription ? .white : .black)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 17))
                Spacer()
            }
            
            if showDescription {
                HStack {
                    Text(item.description)
                        .foregroundStyle(.white)
                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 17))
                    Spacer()
                }
            }
            
            HStack {
                Spacer()
                Image(systemName: showDescription ? "chevron.up" : "chevron.down")
                    .foregroundStyle(showDescription ? .white : .black)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(fixedSize: 28))
                Spacer()
            }
        }
        .padding()
        .background(showDescription ? Colors.greenCustom.swiftUIColor : Color.white)
        .cornerRadius(7, corners: .allCorners)
        .shadow(color: .black.opacity(0.1), radius: 2)
        .onTapGesture {
            withAnimation {
                showDescription.toggle()
            }
        }
    }
}

#Preview {
    ZStack {
        Colors.background.swiftUIColor
            .ignoresSafeArea()
        
        AdviceCell(item: .init(
            title: "Jakie aktywności mogę wykonywać bez użycia gadżetów?",
            description: "Odkryj świat aktywności niewymagających użycia urządzeń cyfrowych za pomocą naszej aplikacji podczas oszczędzania na swoją podróż lub wydarzenie specjalne. Bez względu na to, czy chodzi o eksplorację natury, próbowanie nowych hobby, czy uczestnictwo w doświadczeniach kulturalnych, nasza aplikacja oferuje porady, abyś mógł się bawić bez korzystania z ekranów.")
        )
        .padding()
    }
}
