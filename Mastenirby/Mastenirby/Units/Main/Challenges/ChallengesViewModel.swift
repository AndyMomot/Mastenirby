//
//  ChallengesViewModel.swift
//  Mastenirby
//
//  Created by Andrii Momot on 08.05.2024.
//

import Foundation

extension ChallengesView {
    final class ChallengesViewModel: ObservableObject {
        @Published var prizeNumber = DefaultsService.prizeNumber
        @Published var showAddChallenge = false
        @Published var challenges: [ChallengeView.ChallengeModel] = []
        @Published var showChallengeDetails = false
        
        var challengeDetailToShow: ChallengeView.ChallengeModel?
        
        func getChallenges() {
            DispatchQueue.main.async {
                self.challenges = DefaultsService.getChallengeItems().sorted(by: {
                    $0.dateCreated > $1.dateCreated
                })
                
                var newArray = self.challenges
                for (index, item) in newArray.enumerated() {
                    if item.progress >= 1 {
                        // Completed the challenge
                        DefaultsService.addPrice(number: item.prize)
                        newArray.remove(at: index)
                    }
                }
                
                DefaultsService.setChallenge(items: newArray)
                self.challenges = newArray
            }
        }
        
        func onChallangeCell(action: ChallengeCell.Action, for item: ChallengeView.ChallengeModel) {
            DispatchQueue.main.async {
                if let index = self.challenges.firstIndex(where: { $0.id == item.id }) {
                    switch action {
                    case .start:
                        let hours = item.hours
                        let deadline = Date().addOrSubtract(component: .hour, value: hours)
                        self.challenges[index].deadline = deadline
                        DefaultsService.setChallenge(items: self.challenges)
                        self.getChallenges()
                    case .finish:
                        self.challenges.remove(at: index)
                        DefaultsService.setChallenge(items: self.challenges)
                        self.getChallenges()
                    }
                }
            }
        }
    }
}
