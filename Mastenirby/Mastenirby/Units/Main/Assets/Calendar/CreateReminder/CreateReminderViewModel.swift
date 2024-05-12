//
//  CreateReminderViewModel.swift
//  Mastenirby
//
//  Created by Andrii Momot on 12.05.2024.
//

import Foundation

extension CreateReminderView {
    final class CreateReminderViewModel: ObservableObject {
        @Published var name = ""
        @Published var description = ""
        @Published var date = Date()
        @Published var startTime = Date()
        @Published var finishTime = Date()
        @Published var isAutoDelete = true
        
        func createReminder(completion: @escaping () -> Void) {
            DispatchQueue.main.async {
                if self.isValidFields() {
                    let model = EventModel(
                        name: self.name,
                        description: self.description,
                        date: self.date,
                        start: self.startTime,
                        end: self.finishTime,
                        autoDelete: self.isAutoDelete
                    )
                    
                    DefaultsService.saveCalendar(event: model)
                    completion()
                }
            }
        }
        
        private func isValidFields() -> Bool {
            let isValidEventName = !name.isEmpty
            let isValidEventDescription = !description.isEmpty
            let isValidTime = startTime <= finishTime
            return isValidEventName && isValidEventDescription && isValidTime
        }
    }
}

extension CreateReminderView {
    struct EventModel: Codable, Identifiable {
        var id = UUID()
        var name, description: String
        var date, start, end: Date
        var autoDelete: Bool
    }
}
