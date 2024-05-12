//
//  CreateProductView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 12.05.2024.
//

import SwiftUI

struct CreateProductView: View {
    var onAction: (EventShopView.CreateProductAction) -> Void
    
    @State private var name = ""
    @State private var dollars: Double = 0
    @State private var canPayWithStars = false
    @State private var stars: Double = 0
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                HStack {
                    Text("Stwórz produkt")
                        .foregroundStyle(.black)
                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 17))
                    Spacer()
                }
                
                InputFieldView(title: "Nazwa", text: $name)
                
                HStack {
                    Text("Cena")
                        .foregroundColor(.black)
                        .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 14))
                    Spacer()
                    Text(dollars.string(maximumFractionDigits: 0) + " $")
                        .foregroundColor(Colors.greenCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 17))
                }
                
                StepSlider(
                    value: $dollars,
                    step: 1.0)
                
                Toggle(isOn: $canPayWithStars) {
                    Text("Płać nagrodami")
                        .foregroundColor(.black)
                        .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 14))
                }
                
                if canPayWithStars {
                    HStack {
                        Text("Cena")
                            .foregroundColor(.black)
                            .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 14))
                        
                        Spacer()
                        
                        HStack {
                            Text(stars.string(maximumFractionDigits: 0))
                                .foregroundColor(Colors.greenCustom.swiftUIColor)
                                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 17))
                            
                            Asset.starYellow.swiftUIImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24)
                        }
                    }
                    
                    StepSlider(
                        value: $stars,
                        step: 1.0)
                }
                
                HStack(spacing: 20) {
                    NextButtonView(title: "Z powrotem",
                                   color: Colors.redCustom.swiftUIColor) {
                        onAction(.cancel)
                    }
                    
                    NextButtonView(title: "Ratować") {
                        onAction(.save(item: createProductItem()))
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15, corners: .allCorners)
        }
    }
}

private extension CreateProductView {
    func createProductItem() -> EventShopView.ProductModel {
        var stars: Int? {
            if canPayWithStars {
                return self.stars > .zero ? Int(self.stars) : nil
            } else {
                return nil
            }
        }
        
        return EventShopView.ProductModel(
            name: name,
            dollarsPrice: Int(dollars),
            starsPrice: stars
        )
    }
}

#Preview {
    ZStack {
        Colors.transparentBackground.swiftUIColor
            .ignoresSafeArea()
        
        CreateProductView { _ in }
            .padding(.horizontal)
    }
}
