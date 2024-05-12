//
//  CalendarEventCell.swift
//  Mastenirby
//
//  Created by Andrii Momot on 12.05.2024.
//

import SwiftUI

struct CalendarEventCell: View {
    var item: CreateReminderView.EventModel
    var onDelete: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                HStack(spacing: 0) {
                    Text(item.start.toString(format: .HHMM))
                    Text(" - ")
                    Text(item.end.toString(format: .HHMM))
                }
                .foregroundColor(.gray)
                .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 12))
                
                Spacer()
                
                Button {
                    onDelete()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .scaledToFit()
                        .frame(width: 36)
                        .foregroundStyle(Colors.greenCustom.swiftUIColor)
                        .overlay {
                            Image(systemName: "trash")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .frame(width: 16)
                        }
                }
            }
            
            Text(item.name)
                .foregroundStyle(.black)
                .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 16))
            
            Text(item.description)
                .foregroundStyle(.gray)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
        }
        .padding()
        .background(.white)
        .cornerRadius(10, corners: .allCorners)
    }
}

#Preview {
    ZStack {
        Colors.transparentBackground.swiftUIColor
            .ignoresSafeArea()
        
        CalendarEventCell(item: .init(
            name: "Kup sztalugę",
            description: "Sklep na ulicy Szewczenki",
            date: .init(),
            start: .init(),
            end: .init(),
            autoDelete: true)) {}
            .padding()
    }
}
