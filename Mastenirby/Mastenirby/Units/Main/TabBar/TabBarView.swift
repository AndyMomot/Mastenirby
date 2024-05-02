//
//  TabBarView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedItem: Int
    private let bounds = UIScreen.main.bounds
    
    private let items: [TabBar.Item] = [
        .init(image: Asset.homeTab.name,
              selectedImage: Asset.homeTabSelected.name,
              title: "Dom"),
        .init(image: Asset.budgetTab.name,
              selectedImage: Asset.budgetTabSelected.name,
              title: "Budżet"),
        .init(image: Asset.visasTab.name,
              selectedImage: Asset.visasTabSelected.name,
              title: "Wizy"),
        .init(image: Asset.assetsTab.name,
              selectedImage: Asset.assetsTabSelected.name,
              title: "Aktywa"),
        .init(image: Asset.analyticsTab.name,
              selectedImage: Asset.analyticsTabSelected.name,
              title: "Analizy"),
    ]
    
    var body: some View {
        let tabIndices = Array(0..<items.count)
        
        ZStack {
            Rectangle()
                .foregroundStyle(Colors.background.swiftUIColor)
                .frame(height: bounds.height * 0.133)
            
            HStack {
                Spacer()
                ForEach(tabIndices, id: \.self) { index in
                    let item = items[index]
                    if selectedItem == index {
                        ZStack {
                            Asset.tabGreenBackground.swiftUIImage
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: bounds.width * 0.21)
                            VStack(spacing: 5) {
                                Image(item.selectedImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: bounds.width * 0.112)
                                
                                Text(item.title)
                                    .foregroundStyle(Color.white)
                                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 10))
                            }
                        }
                        .onTapGesture {
                            withAnimation {
                                selectedItem = index
                            }
                        }
                    } else {
                        VStack(spacing: 5) {
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: bounds.width * 0.112)
                            
                            Text(item.title)
                                .foregroundStyle(Color.black)
                                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 10))
                        }
                        .onTapGesture {
                            withAnimation {
                                selectedItem = index
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
        }
        .shadow(color: .black.opacity(0.2), radius: 8, y: -4)
    }
}

#Preview {
    TabBarView(selectedItem: .constant(0))
        .previewLayout(.sizeThatFits)
}
