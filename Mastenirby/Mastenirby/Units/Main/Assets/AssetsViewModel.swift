//
//  AssetsViewModel.swift
//  Mastenirby
//
//  Created by Andrii Momot on 12.05.2024.
//

import Foundation

extension AssetsView {
    final class AssetsViewModel: ObservableObject {
        @Published var eventItems: [HomeView.EventItem] = []
        
        func setEvents() {
            DispatchQueue.main.async {
                self.eventItems = DefaultsService.getEventItems().sorted(by: {
                    $0.date > $1.date
                })
            }
        }
    }
}
