//
//  ProductDetailView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 12.05.2024.
//

import SwiftUI

struct ProductDetailView: View {
    var item: EventShopView.ProductModel
    var onAction: (Action) -> Void
    
    @State private var prizeNumber = 0
    @State private var dollarsSelected = true
    @State private var starsSelected = false
    
    var body: some View {
        VStack {
            HStack {
                Text(item.name)
                    .foregroundStyle(Colors.greenCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 17))
                Spacer()
            }
            
            HStack {
                Spacer()
                
                HStack {
                    CheckBox(isSelected: $dollarsSelected)
                    .frame(width: 20, height: 20)
                    
                    Text("\(item.dollarsPrice) $")
                        .foregroundStyle(Colors.greenCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 17))
                }
                
                if let starsPrice = item.starsPrice {
                    Spacer()
                    CheckBox(isSelected: $starsSelected)
                    .frame(width: 20, height: 20)
                    
                    HStack {
                        Text("\(starsPrice)")
                            .foregroundStyle(Colors.greenCustom.swiftUIColor)
                            .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 17))
                        
                        Asset.starYellow.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                            .overlay {
                                Text("\(self.prizeNumber)")
                                    .foregroundStyle(.black)
                                    .font(Fonts.SFProDisplay.heavy.swiftUIFont(size: 10))
                            }
                    }
                }
                Spacer()
            }
            
            HStack(spacing: 10) {
                NextButtonView(title: "Zamknąć",
                               color: Colors.redCustom.swiftUIColor) {
                    onAction(.cancel)
                }
                
                NextButtonView(title: "Wykonać") {
                    if dollarsSelected {
                        onAction(.buyWithDollars)
                    } else if starsSelected {
                        onAction(.buyWithStars)
                    }
                }
                .padding(.vertical)
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(15, corners: .allCorners)
        .onAppear {
            prizeNumber = DefaultsService.prizeNumber
        }
        .onChange(of: dollarsSelected) { oldValue, newValue in
            if item.starsPrice != nil {
                dollarsSelected = newValue
                starsSelected = oldValue
            } else {
                dollarsSelected = true
                starsSelected = false
            }
        }
        .onChange(of: starsSelected) { oldValue, newValue in
            if item.starsPrice != nil {
                dollarsSelected = oldValue
                starsSelected = newValue
            } else {
                dollarsSelected = true
                starsSelected = false
            }
        }
    }
}

extension ProductDetailView {
    enum Action {
        case cancel
        case buyWithDollars
        case buyWithStars
    }
}

#Preview {
    ZStack {
        Colors.transparentBackground.swiftUIColor
            .ignoresSafeArea()
        ProductDetailView(item: .init(name: "Test", 
                                dollarsPrice: 200,
                                starsPrice: 100)) { _ in }
        .padding()
    }
}
