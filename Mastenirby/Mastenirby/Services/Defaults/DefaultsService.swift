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

extension DefaultsService {
    static func setChallenge(item: ChallengeView.ChallengeModel) {
        var challenge = getChallengeItems()
        challenge.append(item)
        setChallenge(items: challenge)
    }
    
    static func setChallenge(items: [ChallengeView.ChallengeModel]) {
        if let data = try? JSONEncoder().encode(items) {
            standard.set(data, forKey: Keys.challenges.rawValue)
        }
    }
    
    static func getChallengeItems() -> [ChallengeView.ChallengeModel] {
        if let data = standard.object(forKey: Keys.challenges.rawValue) as? Data {
            let items = try? JSONDecoder().decode([ChallengeView.ChallengeModel].self, from: data)
            return items ?? []
        }
        return []
    }
    
    static func removeChallengeWith(challengeId: String) {
        var challenges = getChallengeItems()
        if let index = challenges.firstIndex(where: { $0.id == challengeId }) {
            challenges.remove(at: index)
            setChallenge(items: challenges)
        }
    }
}

extension DefaultsService {
    static var prizeNumber: Int {
        standard.integer(forKey: Keys.prize.rawValue)
    }
    
    static func addPrice(number: Int) {
        let newValue = prizeNumber + number
        standard.set(newValue, forKey: Keys.prize.rawValue)
    }
    
    static func subtractPrice(number: Int) -> Bool {
        guard number < prizeNumber else { return false }
        let newValue = prizeNumber - number
        standard.set(newValue, forKey: Keys.prize.rawValue)
        return true
    }
}

extension DefaultsService {
    static func setProduct(item: EventShopView.ProductModel, for id: String) {
        var products = getProductsFor(groupId: id)
        products.append(item)
        setProduct(items: products, for: id)
    }
    
    static func setProduct(items: [EventShopView.ProductModel], for id: String) {
        if let data = try? JSONEncoder().encode(items) {
            let key = Keys.product.rawValue + id
            standard.set(data, forKey: key)
        }
    }
    
    static func getProductsFor(groupId id: String) -> [EventShopView.ProductModel] {
        let key = Keys.product.rawValue + id
        if let data = standard.object(forKey: key) as? Data {
            let items = try? JSONDecoder().decode([EventShopView.ProductModel].self, from: data)
            return items ?? []
        }
        return []
    }
}

extension DefaultsService {
    static var getCalendarEvents: [CreateReminderView.EventModel] {
        if let data = standard.object(forKey: Keys.calendarEvent.rawValue) as? Data {
            let items = try? JSONDecoder().decode([CreateReminderView.EventModel].self, from: data)
            return items ?? []
        }
        return []
    }
    
    static func saveCalendar(event: CreateReminderView.EventModel) {
        var events = getCalendarEvents
        events.append(event)
        if let data = try? JSONEncoder().encode(events) {
            standard.set(data, forKey: Keys.calendarEvent.rawValue)
        }
    }
    
    static func removeCalendar(event: CreateReminderView.EventModel) {
        var events = getCalendarEvents
        
        if let index = events.firstIndex(where: {$0.id == event.id}) {
            events.remove(at: index)
            
            if let data = try? JSONEncoder().encode(events) {
                standard.set(data, forKey: Keys.calendarEvent.rawValue)
            }
        }
    }
}

extension DefaultsService {
    static func getDetoxCosts() -> [AddEventView.AddEventViewModel.DetoxCostModel] {
        if let data = standard.object(forKey: Keys.detoxCosts.rawValue) as? Data {
            let items = try? JSONDecoder().decode([AddEventView.AddEventViewModel.DetoxCostModel].self, from: data)
            return items ?? []
        }
        return []
    }
    
    static func saveDetox(cost: AddEventView.AddEventViewModel.DetoxCostModel) {
        var costs = getDetoxCosts()
        costs.append(cost)
        if let data = try? JSONEncoder().encode(costs) {
            standard.set(data, forKey: Keys.detoxCosts.rawValue)
        }
    }
}

// MARK: - Keys
extension DefaultsService {
    enum Keys: String {
        case events
        case challenges
        case prize
        case product
        case calendarEvent
        case detoxCosts
    }
}
