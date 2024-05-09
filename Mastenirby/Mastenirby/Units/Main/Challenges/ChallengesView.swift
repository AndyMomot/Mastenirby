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
                                viewModel.onChallangeCell(action: action, for: challenge)
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
                    Color.black.opacity(0.4)
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
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            viewModel.showAddChallenge = false
                            viewModel.challengeDetailToShow = nil
                        }
                    ChallengeDetailsView(item: item) {
                        
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
