//
//  EventShopViewModel.swift
//  Mastenirby
//
//  Created by Andrii Momot on 12.05.2024.
//

import Foundation
import SwiftUI

extension EventShopView {
    final class EventShopViewModel: ObservableObject {
        @Published var itemImage = Asset.placeholder.swiftUIImage
        @Published var showAddProduct = false
        @Published var productItems: [ProductModel] = []
        
        @Published var showProductDetails = false
        @Published var productToShow: ProductModel?
        
        func getImage(for item: HomeView.EventItem) {
            guard let data = FileManagerService().getFile(forPath: item.id),
            let image = UIImage(data: data)
            else { return }
            itemImage = Image(uiImage: image)
        }
        
        func getProducts(groupID id: String) {
            DispatchQueue.main.async {
                self.productItems = DefaultsService.getProductsFor(groupId: id)
            }
        }
        
        func createProduct(action: CreateProductAction, groupID id: String) {
            switch action {
            case .cancel:
                showAddProduct = false
            case .save(let item):
                guard !item.name.isEmpty, item.dollarsPrice > .zero else { return }
                DefaultsService.setProduct(item: item, for: id)
                showAddProduct = false
                getProducts(groupID: id)
            }
        }
        
        func buyingAction(action: ProductDetailView.Action, item: HomeView.EventItem) {
            DispatchQueue.main.async {
                guard let product = self.productToShow else { return }
                
                switch action {
                case .cancel:
                    self.productItems.removeAll(where: {$0.id == product.id})
                    DefaultsService.setProduct(items: self.productItems, for: item.id)
                    self.showProductDetails = false
                    self.productToShow = nil
                    self.getProducts(groupID: item.id)
                    
                case .buyWithDollars:
                    if item.amount >= Double(product.dollarsPrice) {
                        var events = DefaultsService.getEventItems()
                        if let index = events.firstIndex(where: {$0.id == item.id}) {
                            events[index].amount -= Double(product.dollarsPrice)
                        }
                        DefaultsService.setEvent(items: events)
                        self.showProductDetails = false
                        self.productToShow = nil
                    }
                    
                case .buyWithStars:
                    if let starsPrice = product.starsPrice, DefaultsService.prizeNumber >= starsPrice {
                        if DefaultsService.subtractPrice(number: starsPrice) {
                            self.showProductDetails = false
                            self.productToShow = nil
                        }
                    }
                }
            }
        }
    }
}

extension EventShopView {
    struct ProductModel: Identifiable, Codable {
        private(set) var id = UUID().uuidString
        var name: String
        var dollarsPrice: Int
        var starsPrice: Int?
    }
    
    enum CreateProductAction {
        case cancel
        case save(item: ProductModel)
    }
}
