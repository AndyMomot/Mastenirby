//
//  ChallengesViewModel.swift
//  Mastenirby
//
//  Created by Andrii Momot on 08.05.2024.
//

import Foundation

extension ChallengesView {
    final class ChallengesViewModel: ObservableObject {
        @Published var showAddChallenge = false
        @Published var challenges: [ChallengeView.ChallengeModel] = []
        
        func getChallenges() {
            DispatchQueue.main.async {
                self.challenges = DefaultsService.getChallengeItems().sorted(by: {
                    $0.dateCreated > $1.dateCreated
                })
            }
        }
    }
}
