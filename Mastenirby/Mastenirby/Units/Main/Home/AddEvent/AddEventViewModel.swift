//
//  AddEventViewModel.swift
//  Mastenirby
//
//  Created by Andrii Momot on 06.05.2024.
//

import Foundation
import UIKit

extension AddEventView {
    final class AddEventViewModel: ObservableObject {
        @Published var showGallery = false
        @Published var selectedImageData: Data = .init()
        @Published var name: String = ""
        @Published var goal: Double = .zero
        @Published var amountText: String = ""
        @Published var isDetoxification = false
        
        @Published var selectedSegmentIndex = 0
        let segments = ["Uzupełniać", "Wypłacić"]
        
        func setItem(item: HomeView.EventItem?) {
            guard let item = item else { return }
            name = item.name
            goal = item.goal
            
            guard let data = FileManagerService().getFile(forPath: item.id) else { return }
            selectedImageData = data
        }
        
        func onSave(with item: HomeView.EventItem?, completion: @escaping () -> Void) {
            DispatchQueue.main.async {
                guard let item = item else {
                    // save new item
                    self.addEvent {
                        completion()
                    }
                    return
                }
                
                // update item
                self.update(event: item) {
                    completion()
                }
            }
        }
    }
}

private extension AddEventView.AddEventViewModel {
    func addEvent(completion: @escaping () -> Void) {
        guard isValidFields() else { return }
        let item = HomeView.EventItem(name: name,
                                      isDetoxification: isDetoxification, 
                                      goal: goal)
        DefaultsService.setEvent(item: item)
        setImage(data: selectedImageData, forPath: item.id)
        completion()
    }
    
    func update(event: HomeView.EventItem, completion: @escaping () -> Void) {
        guard isValidFields() else { return }
        var items = DefaultsService.getEventItems()
        if let index = items.firstIndex(where: { $0.id == event.id }) {
            items[index].name = name
            items[index].goal = goal
            setImage(data: selectedImageData, forPath: items[index].id)
            
            if let amount = Double(amountText), amount > .zero {
                switch selectedSegmentIndex {
                case 0:
                    items[index].amount += amount
                case 1:
                    items[index].amount -= amount
                default:
                    break
                }
            }
        }
        DefaultsService.setEvent(items: items)
        completion()
    }
    
    func isValidFields() -> Bool {
        return !name.isEmpty && goal > .zero
    }
    
    func setImage(data: Data, forPath path: String) {
        guard UIImage(data: selectedImageData) != nil else {
            FileManagerService().removeFile(forPath: path)
            return
        }
        
        FileManagerService().saveFile(data: data, forPath: path)
    }
}
