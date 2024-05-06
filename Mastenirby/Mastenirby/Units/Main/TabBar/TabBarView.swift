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
            
            HStack {
                Spacer()
                ForEach(tabIndices, id: \.self) { index in
                    let item = items[index]
                    
                    ZStack {
                        Asset.tabGreenBackground.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(height: bounds.width * 0.14)
                            .opacity(selectedItem == index ? 1 : 0)
                        
                        VStack(spacing: 5) {
                            Image(selectedItem == index ? item.selectedImage : item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: bounds.width * 0.06)
                            
                            Text(item.title)
                                .foregroundStyle(selectedItem == index  ? .white : .black)
                                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 10))
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            selectedItem = index
                        }
                    }
                    
                    Spacer()
                }
            }
        }
        .shadow(color: .black.opacity(0.2), radius: 8, y: -4)
        .frame(height: bounds.height * 0.098)
    }
}

#Preview {
    TabBarView(selectedItem: .constant(0))
        .previewLayout(.sizeThatFits)
}
