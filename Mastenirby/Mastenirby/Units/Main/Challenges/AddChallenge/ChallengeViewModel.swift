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
                let hoursLeft = Date().hoursUntilFutureDate(futureDate: deadline)
                return Double(hoursLeft) / Double(hours)
            }
            
            return 0.0
        }
        
        var deadlineText: String {
            guard let deadline = deadline else {
                return "\(hours) godz"
            }
            
            let hoursLeft = Date().hoursUntilFutureDate(futureDate: deadline)
            
            var dateFormatter: DateFormatter {
                let formatter = DateFormatter()
                formatter.dateFormat = "HH'h' mm'm'"
                return formatter
            }
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: deadline)
            
            let hourString = "\(components.hour ?? 0)g"
            let minuteString = "\(components.minute ?? 0)m"
            
            let formattedString = "\(hourString) \(minuteString)"
            
            return formattedString
        }
    }
}
