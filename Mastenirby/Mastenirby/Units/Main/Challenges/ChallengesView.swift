//
//  VisasView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct ChallengesView: View {
    @StateObject private var viewModel = ChallengesViewModel()
    private let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Colors.background.swiftUIColor
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    // Top image
                    TopWallPaperView(title: "Wizy")
                        .overlay {
                            VStack {
                                HStack {
                                    Spacer()
                                    Asset.starYellow.swiftUIImage
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 36)
                                        .overlay {
                                            Text("\(viewModel.prizeNumber)")
                                                .foregroundStyle(.black)
                                                .font(Fonts.SFProDisplay.heavy.swiftUIFont(size: 12))
                                        }
                                }
                                
                                Spacer()
                            }
                            .padding()
                        }
                    
                    ForEach(viewModel.challenges) { challenge in
                        Button {
                            viewModel.challengeDetailToShow = challenge
                            viewModel.showChallengeDetails = true
                        } label: {
                            ChallengeCell(item: challenge) { action in
                                viewModel.onChallengeCell(action: action, for: challenge)
                                viewModel.hideChallengeDetails()
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                }
            }
        }
        .overlay {
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        viewModel.showAddChallenge.toggle()
                    } label: {
                        Circle()
                            .foregroundStyle(Colors.greenCustom.swiftUIColor)
                            .frame(width: 58)
                            .overlay {
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundStyle(.white)
                                    .padding()
                            }
                    }
                    .padding()
                }
            }
        }
        .overlay {
            if viewModel.showAddChallenge {
                ZStack {
                    Colors.transparentBackground.swiftUIColor
                        .ignoresSafeArea()
                    
                    ChallengeView {
                        viewModel.showAddChallenge = false
                        viewModel.getChallenges()
                    }
                }
            }
        }
        .overlay {
            if viewModel.showChallengeDetails, let item = viewModel.challengeDetailToShow {
                ZStack {
                    Colors.transparentBackground.swiftUIColor
                        .ignoresSafeArea()
                        .onTapGesture {
                            viewModel.hideChallengeDetails()
                        }
                    ChallengeDetailsView(item: item) { action in
                        viewModel.onChallengeCell(action: action, for: item)
                        viewModel.hideChallengeDetails()
                    }
                    .padding(.horizontal)
                }
            }
        }
        .overlay {
            if viewModel.showDeleteChallengeAlert {
                ZStack {
                    Colors.transparentBackground.swiftUIColor
                        .ignoresSafeArea()
                    
                    CustomAlert(
                        title: "Skończyć wcześniej?",
                        message: "Czy na pewno chcesz zakończyć to wyzwanie wcześniej?",
                        okTitle: "Skończyć",
                        cancelTitle: "Kontynuować") {
                            viewModel.onDeleteChallenge()
                        } onCancel: {
                            viewModel.showDeleteChallengeAlert.toggle()
                        }
                        .padding(.horizontal)
                }
            }
        }
        .onAppear {
            viewModel.getChallenges()
        }
        .onReceive(timer) { input in
            viewModel.getChallenges()
        }
    }
}

#Preview {
    ChallengesView()
}
