//
//  ProductCell.swift
//  Mastenirby
//
//  Created by Andrii Momot on 12.05.2024.
//

import SwiftUI

struct ProductCell: View {
    var event: HomeView.EventItem
    var product: EventShopView.ProductModel
    var onAction: () -> Void
    
    @State private var progress = 0.0
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(product.name)
                    .foregroundStyle(.black)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 17))
                Spacer()
                
                HStack {
                    Text("\(product.dollarsPrice) $")
                        .foregroundStyle(Colors.greenCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 17))
                    
                    if let starsPrice = product.starsPrice {
                        Text("/")
                            .foregroundStyle(Colors.greenCustom.swiftUIColor)
                            .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 17))
                        
                        Asset.starYellow.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .overlay {
                                Text("\(starsPrice)")
                                    .foregroundStyle(.black)
                                    .font(Fonts.SFProDisplay.heavy.swiftUIFont(size: 10))
                            }
                    }
                }
            }
            
            ProgressView(value: progress.clamped(to: 0.0...1.0))
                .accentColor(Colors.greenCustom.swiftUIColor)
                .frame(height: 7)
            
            NextButtonView(title: "Więcej szczegółów") {
                onAction()
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(15, corners: .allCorners)
        .onAppear {
            progress = Double(event.amount) / Double(product.dollarsPrice)
        }
    }
}

#Preview {
    ZStack {
        Colors.transparentBackground.swiftUIColor
            .ignoresSafeArea()
        
        ProductCell(
            event: .init(name: "Event", isDetoxification: true, goal: 500, amount: 300),
            product: .init(name: "Product", dollarsPrice: 400, starsPrice: 45)) {}
        .padding()
    }
}
