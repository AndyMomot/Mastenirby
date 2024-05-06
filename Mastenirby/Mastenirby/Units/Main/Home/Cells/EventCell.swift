//
//  EventCell.swift
//  Mastenirby
//
//  Created by Andrii Momot on 06.05.2024.
//

import SwiftUI

struct EventCell: View {
    var item: HomeView.EventItem
    var onDelete: (_ id: String) -> Void
    
    @State private var itemImage: Image = Asset.placeholder.swiftUIImage
    
    var body: some View {
        VStack(spacing: 10) {
            itemImage
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height * 0.2)
                .clipped()
            
            VStack(spacing: 10) {
                HStack {
                    Text(item.name)
                        .foregroundStyle(.black)
                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 17))
                    Spacer()
                    Text("\(item.amount.string())$")
                        .foregroundStyle(Colors.greenCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 17))
                }
            }
            .padding(20)
        }
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        onDelete(item.id)
                    } label: {
                        Circle()
                            .foregroundStyle(Colors.greenCustom.swiftUIColor)
                            .frame(width: 28)
                            .overlay {
                                Image(systemName: "trash")
                                    .foregroundStyle(.white)
                            }
                    }

                }
                Spacer()
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(40, corners: .allCorners)
        .shadow(color: .black.opacity(0.2), radius: 2)
        .onAppear {
            guard let data = FileManagerService().getFile(forPath: item.id),
            let image = UIImage(data: data)
            else { return }
            itemImage = Image(uiImage: image)
        }
    }
}

#Preview {
    ZStack {
        Colors.background.swiftUIColor
            .ignoresSafeArea()
        EventCell(item: .init(name: "Lekcja malarstwa", 
                              amount: 500)) { _ in
            
        }
    }
}
