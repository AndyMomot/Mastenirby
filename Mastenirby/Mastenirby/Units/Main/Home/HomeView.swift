//
//  HomeView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Colors.background.swiftUIColor
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 10) {
                        // Top image
                        TopWallPaperView(title: "Dom")
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
                        
                        // Events
                        ForEach(viewModel.eventItems) { event in
                            NavigationLink(value: event) {
                                EventCell(item: event) { idToDelete in
                                    viewModel.eventIdToDelete = idToDelete
                                    viewModel.showDeleteEventAlert.toggle()
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                        
                        // Motivation
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 10),
                                            GridItem(.flexible(), spacing: 0)],
                                  spacing: 10) {
                            ForEach(viewModel.motivationItems) { item in
                                NavigationLink(value: item) {
                                    MotivationCell(item: item)
                                }
                            }
                        }
                                  .padding(.horizontal, 10)
                    }
                }
                
                // Delete event alert
                if viewModel.showDeleteEventAlert {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                    CustomAlert(
                        title: "Usuwać ?",
                        message: "Czy na pewno chcesz usunąć ten cel?",
                        okTitle: "Usuwać",
                        cancelTitle: "Ratować",
                        onOkay: {
                            viewModel.deleteEvent()
                            viewModel.showDeleteEventAlert.toggle()
                        },
                        onCancel: {
                            viewModel.showDeleteEventAlert.toggle()
                        })
                    .padding()
                }
            }
            .navigationDestination(for: HomeView.MotivationItem.self) { item in
                MotivationDetailsView(item: item)
            }
            .navigationDestination(for: HomeView.EventItem.self) { item in
                AddEventView(item: item)
            }
            .onAppear {
                viewModel.setEvents()
            }
        }
    }
}

#Preview {
    HomeView()
}
