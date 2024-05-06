//
//  DefaultsService.swift
//  Maximidriveup
//
//  Created by Andrii Momot on 16.04.2024.
//

import Foundation

final class DefaultsService {
    static let standard = UserDefaults.standard
    private init() {}
}

extension DefaultsService {
    static func setEvent(item: HomeView.EventItem) {
        var events = getEventItems()
        events.append(item)
        setEvent(items: events)
    }
    
    static func setEvent(items: [HomeView.EventItem]) {
        if let data = try? JSONEncoder().encode(items) {
            standard.set(data, forKey: Keys.events.rawValue)
        }
    }
    
    static func getEventItems() -> [HomeView.EventItem] {
        if let data = standard.object(forKey: Keys.events.rawValue) as? Data {
            let items = try? JSONDecoder().decode([HomeView.EventItem].self, from: data)
            return items ?? []
        }
        return []
    }
    
    static func removeEventWith(eventId: String) {
        var events = getEventItems()
        if let index = events.firstIndex(where: { $0.id == eventId }) {
            events.remove(at: index)
            setEvent(items: events)
        }
    }
}

// MARK: - Keys
extension DefaultsService {
    enum Keys: String {
        case events
    }
}
