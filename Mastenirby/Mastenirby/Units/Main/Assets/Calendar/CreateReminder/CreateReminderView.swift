//
//  CreateReminderView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 12.05.2024.
//

import SwiftUI

struct CreateReminderView: View {
    @Binding var show: Bool
    @StateObject private var viewModel = CreateReminderViewModel()
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    HStack {
                        Spacer()
                        Text("Utwórz wydarzenie")
                            .foregroundStyle(.black)
                            .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 20))
                        Spacer()
                    }
                    
                    InputFieldView(title: "Nazwa wydarzenia", text: $viewModel.name)
                        .frame(height: 50)
                        .padding(.top)
                    
                    InputFieldResizable(title: "Opis", text: $viewModel.description)
                        .frame(minHeight: 88)
                    
                    ZStack {
                        Colors.labelReversed.swiftUIColor
                            .cornerRadius(10)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                            .foregroundColor(Color.clear)
                            .frame(height: 50)
                            .overlay(
                                DatePicker(selection: $viewModel.date,
                                           in: Date()...,
                                           displayedComponents: .date) {
                                               Text("Data")
                                                   .foregroundColor(.black)
                                                   .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 15))
                                           }
                                    .padding()
                            )
                    }
                    
                    ZStack {
                        Colors.labelReversed.swiftUIColor
                            .cornerRadius(10)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                            .foregroundColor(Color.clear)
                            .frame(height: 50)
                            .overlay(
                                DatePicker(selection: $viewModel.startTime,
                                           displayedComponents: .hourAndMinute) {
                                               Text("Czas rozpoczęcia")
                                                   .foregroundColor(.black)
                                                   .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 15))
                                           }
                                    .padding()
                            )
                    }
                    
                    ZStack {
                        Colors.labelReversed.swiftUIColor
                            .cornerRadius(10)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                            .foregroundColor(Color.clear)
                            .frame(height: 50)
                            .overlay(
                                DatePicker(selection: $viewModel.finishTime,
                                           displayedComponents: .hourAndMinute) {
                                               Text("Czas rozpoczęcia")
                                                   .foregroundColor(.black)
                                                   .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 15))
                                           }
                                    .padding()
                            )
                    }
                    
                    HStack(spacing: .zero) {
                        Text("Usuń po uruchomieniu")
                            .foregroundColor(.black)
                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                        Spacer()
                        Toggle(isOn: $viewModel.isAutoDelete) {}
                            .tint(.black)
                            .frame(maxWidth: 42)
                            .padding(.trailing)
                    }
                }
            }
            
            HStack(spacing: 10) {
                NextButtonView(title: "Usuwać",
                               color: Colors.redCustom.swiftUIColor) {
                    show = false
                }
                
                NextButtonView(title: "Tworzyć") {
                    viewModel.createReminder {
                        show = false
                    }
                }
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(32, corners: [.topLeft, .topRight])
    }
}

#Preview {
    CreateReminderView(show: .constant(true))
}
