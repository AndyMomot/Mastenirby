//
//  AddEventView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 06.05.2024.
//

import SwiftUI
import UIKit

struct AddEventView: View {
    var item: HomeView.EventItem?
    
    @StateObject private var viewModel = AddEventViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Colors.background.swiftUIColor
                .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    // Image
                    VStack(spacing: 0) {
                        if let image = UIImage(data: viewModel.selectedImageData) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: UIScreen.main.bounds.height * 0.2)
                                .clipped()
                        } else {
                            ZStack {
                                Rectangle()
                                    .foregroundStyle(.black)
                                    .opacity(0.5)
                                    .frame(height: UIScreen.main.bounds.height * 0.2)
                                
                                Text("Zdjęcie")
                                    .foregroundStyle(.black)
                                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 37))
                            }
                        }
                        
                        // Form
                        ZStack {
                            VStack(spacing: 20) {
                                HStack {
                                    Text("Tworzenie celu")
                                    Spacer()
                                    
                                    Button {
                                        viewModel.showGallery.toggle()
                                    } label: {
                                        Text("Załaduj zdjęcie")
                                            .foregroundStyle(Colors.greenCustom.swiftUIColor)
                                            .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 14))
                                    }
                                }
                                
                                InputFieldView(title: "Nazwa",
                                               text: $viewModel.name)
                                
                                HStack {
                                    Text("Suma")
                                        .foregroundStyle(.black)
                                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 15))
                                    Spacer()
                                    
                                    Text("\(viewModel.amount.string())$")
                                        .foregroundStyle(Colors.greenCustom.swiftUIColor)
                                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 15))
                                }
                                
                                StepSlider(
                                    value: $viewModel.amount,
                                    step: 0.5)
                            }
                            .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
                
                HStack(spacing: 10) {
                    NextButtonView(title: "Z powrotem",
                                   color: Colors.redCustom.swiftUIColor) {
                        dismiss.callAsFunction()
                    }
                    
                    NextButtonView(title: "Ratować") {
                        viewModel.onSave(with: item) {
                            dismiss.callAsFunction()
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $viewModel.showGallery) {
            ImagePicker(selectedImageData: $viewModel.selectedImageData)
        }
        .onAppear {
            viewModel.setItem(item: item)
        }
    }
}

#Preview {
    AddEventView()
}
