//
//  ChallengeView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 08.05.2024.
//

import SwiftUI

struct ChallengeView: View {
    @StateObject private var viewModel = ChallengeViewModel()
    var onDismiss: () -> Void
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("Tworzenie wyzwanie")
                        .foregroundStyle(Colors.greenCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 17))
                    Spacer()
                    
                    Button {
                        onDismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 18)
                            .foregroundStyle(.black)
                            .fontWeight(.medium)
                    }

                }
                
                InputFieldView(title: "Nazwa",
                               text: $viewModel.name)
                
                InputFieldResizable(title: "Opis",
                                    text: $viewModel.description)
                .frame(minHeight: 150)
                
                HStack {
                    Text("Czas")
                        .foregroundStyle(Color.black)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 15))
                    
                    Spacer()
                    
                    Text("\(viewModel.hours.string(maximumFractionDigits: 0)) g")
                        .foregroundStyle(Colors.greenCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 15))
                }
                
                StepSlider(value: $viewModel.hours, step: 1, range: 0...192)
                
                InputFieldView(title: "Nagroda",
                               rightImage: Asset.starYellow.name,
                               text: $viewModel.prize)
                .keyboardType(.numberPad)
                
                NextButtonView(title: "Utwórz") {
                    viewModel.onSaveTapped {
                        onDismiss()
                    }
                }
            }
            .padding()
            .background(.white)
            .cornerRadius(20, corners: .allCorners)
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    ZStack {
        Colors.transparentBackground.swiftUIColor
            .ignoresSafeArea()
        
        ChallengeView {}
            .padding()
    }
}
