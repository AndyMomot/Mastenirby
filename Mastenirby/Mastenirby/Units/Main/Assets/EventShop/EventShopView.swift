//
//  EventShopView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 12.05.2024.
//

import SwiftUI

struct EventShopView: View {
    var item: HomeView.EventItem
    @StateObject var viewModel = EventShopViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Colors.background.swiftUIColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                viewModel.itemImage
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height * 0.2)
                    .clipped()
                
                VStack(spacing: 10) {
                    HStack {
                        Text(item.name)
                            .foregroundStyle(.black)
                            .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 22))
                        Spacer()
                        Text(item.goal.string(maximumFractionDigits: 0))
                            .foregroundStyle(Colors.greenCustom.swiftUIColor)
                            .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 17))
                    }
                    
                    HStack {
                        Text("Zebrane")
                            .foregroundStyle(.black)
                            .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 17))
                        Spacer()
                        Text(item.amount.string(maximumFractionDigits: 1))
                            .foregroundStyle(.black)
                            .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 17))
                    }
                }
                .padding(.horizontal)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(viewModel.productItems) { item in
                            ProductCell(event: self.item,
                                          product: item) { // on details
                                viewModel.productToShow = item
                                viewModel.showProductDetails = true
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .overlay {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button {
                                viewModel.showAddProduct.toggle()
                            } label: {
                                Circle()
                                    .foregroundStyle(Colors.greenCustom.swiftUIColor)
                                    .frame(width: 58)
                                    .overlay {
                                        Image(systemName: "plus")
                                            .resizable()
                                            .foregroundStyle(.white)
                                            .padding()
                                    }
                            }
                            .padding()
                        }
                    }
                }
                
                NextButtonView(title: "Z powrotem") {
                    dismiss.callAsFunction()
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .onAppear {
                viewModel.getImage(for: item)
                viewModel.getProducts(groupID: item.id)
            }
        }
        .navigationBarBackButtonHidden()
        .overlay {
            if viewModel.showAddProduct {
                ZStack {
                    Colors.transparentBackground.swiftUIColor
                        .ignoresSafeArea()
                    
                    CreateProductView { action in
                        viewModel.createProduct(action: action, groupID: item.id)
                    }
                    .padding()
                }
            }
        }
        .overlay {
            if viewModel.showProductDetails {
                if let productToShow = viewModel.productToShow {
                    ZStack {
                        Colors.transparentBackground.swiftUIColor
                            .ignoresSafeArea()
                            .onTapGesture {
                                viewModel.showProductDetails = false
                                viewModel.productToShow = nil
                            }
                        ProductDetailView(item: productToShow) { action in
                            viewModel.buyingAction(action: action, item: self.item)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    EventShopView(
        item: .init(name: "Lekcja malarstwa",
                    isDetoxification: false,
                    goal: 500)
    )
}
