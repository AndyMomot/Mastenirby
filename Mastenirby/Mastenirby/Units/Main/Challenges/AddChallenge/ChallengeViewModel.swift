//
//  ChallengeViewModel.swift
//  Mastenirby
//
//  Created by Andrii Momot on 08.05.2024.
//

import Foundation

extension ChallengeView {
    final class ChallengeViewModel: ObservableObject {
        @Published var name = ""
        @Published var description = ""
        @Published var hours = 0.0
        @Published var prize = ""
        
        func onSaveTapped(completion: @escaping () -> Void) {
            guard isValidFields() else { return }
            
            DispatchQueue.main.async {
                let model = ChallengeModel(
                    name: self.name,
                    description: self.description,
                    hours: Int(self.hours),
                    prize: Int(self.prize) ?? .zero
                )
                DefaultsService.setChallenge(item: model)
                completion()
            }
        }
        
        func isValidFields() -> Bool {
            !name.isEmpty && !description.isEmpty &&
            hours > .zero && Int(prize) != nil
        }
    }
}

extension ChallengeView {
    struct ChallengeModel: Identifiable, Codable {
        private(set) var id = UUID().uuidString
        private(set) var dateCreated = Date()
        var name, description: String
        var hours: Int
        var prize: Int
        var deadline: Date?
        
        var progress: Double {
            if let deadline = deadline {
                if let difference = Date().differenceBetweenDatesInHoursAndMinutes(from: .init(), to: deadline) {
                    let minutesLeft = Double((difference.hours * 60) + difference.minutes)
                    let minutes = Double(hours * 60)
                    return (minutes - minutesLeft) / minutes
                }
            }
            
            return 0.0
        }
        
        var deadlineText: String {
            guard let deadline = deadline else {
                return "\(hours) godz"
            }
            
            if let difference = Date().differenceBetweenDatesInHoursAndMinutes(from: .init(), to: deadline) {
                return "\(difference.hours)h \(difference.minutes)m"
            }
            
            return "0h 0m"
        }
    }
}
