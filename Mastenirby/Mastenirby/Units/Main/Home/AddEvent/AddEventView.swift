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
                                        .foregroundStyle(.black)
                                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 17))
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
                                    Text("Bramka")
                                        .foregroundStyle(.black)
                                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 15))
                                    Spacer()
                                    
                                    Text("\(viewModel.goal.string())$")
                                        .foregroundStyle(Colors.greenCustom.swiftUIColor)
                                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 15))
                                }
                                
                                HStack {
                                    Text("Te odpady pomagają w detoksykacji")
                                        .foregroundStyle(.black)
                                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 15))
                                    
                                    Spacer()
                                    
                                    Toggle(isOn: $viewModel.isDetoxification, label: {})
                                }
                                
                                StepSlider(
                                    value: $viewModel.goal,
                                    step: 1.0)
                                
                                if item != nil {
                                    HStack {
                                        Picker(selection: $viewModel.selectedSegmentIndex, label: Text("Segments")) {
                                            ForEach(0..<2) { index in
                                                Text(viewModel.segments[index])
                                                    .foregroundColor(.black)
                                            }
                                            .foregroundStyle(.black)
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                    InputFieldView(title: "Kwota",
                                                   text: $viewModel.amountText)
                                    .keyboardType(.numberPad)
                                }
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
