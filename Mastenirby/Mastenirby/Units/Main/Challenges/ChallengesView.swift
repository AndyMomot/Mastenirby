//
//  VisasView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct ChallengesView: View {
    @StateObject private var viewModel = ChallengesViewModel()
    
    var body: some View {
        ZStack {
            Colors.background.swiftUIColor
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    // Top image
                    TopWallPaperView(title: "Wizy")
                     
                    ForEach(viewModel.challenges) { challenge in
                        ChallengeCell(item: challenge) { action in
                            
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
        .onAppear {
            viewModel.getChallenges()
        }
    }
}

#Preview {
    ChallengesView()
}
