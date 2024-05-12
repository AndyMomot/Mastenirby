//
//  AssetsView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct AssetsView: View {
    @StateObject private var viewModel = AssetsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Colors.background.swiftUIColor
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 10) {
                        // Top image
                        TopWallPaperView(title: "Aktywa")
                            .overlay {
                                VStack {
                                    HStack {
                                        Spacer()
                                        NavigationLink(destination: AddEventView()) {
                                            Circle()
                                                .foregroundStyle(Colors.greenCustom.swiftUIColor)
                                                .frame(width: 34)
                                                .overlay {
                                                    Image(systemName: "plus")
                                                        .foregroundStyle(.white)
                                                }
                                        }
                                    }
                                    Spacer()
                                }
                                .padding()
                            }
                        
                        HStack {
                            Spacer()
                            
                            NavigationLink(destination: CustomCalendarView()) {
                                Text("Kalendarz")
                                    .foregroundStyle(Colors.greenCustom.swiftUIColor)
                                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 17))
                            }
                        }
                        .padding(.horizontal, 10)
                        
                        // Events
                        ForEach(viewModel.eventItems) { event in
                            NavigationLink(value: event) {
                                EventCell(item: event) { _ in
                                    
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                }
            }
            .onAppear {
                viewModel.setEvents()
            }
            .navigationDestination(for: HomeView.EventItem.self) { item in
                // By something
                EventShopView(item: item)
            }
        }
    }
}

#Preview {
    AssetsView()
}
