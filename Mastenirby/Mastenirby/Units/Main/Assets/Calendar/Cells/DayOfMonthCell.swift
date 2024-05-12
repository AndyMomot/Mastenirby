//
//  DayOfMonthCell.swift
//  TesejournerX
//
//  Created by Andrii Momot on 01.04.2024.
//

import SwiftUI

struct DayOfMonthCell: View {
    var model: CustomCalendarView.DayOfMonthModel
    
    var body: some View {
        ZStack {
            switch model.state {
            case .today:
                Circle()
                    .foregroundStyle(.white)
                    .frame(maxWidth: 38, maxHeight: 38)
            case .weekDay:
                Circle()
                    .stroke(style: .init())
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.white)
                    .frame(maxWidth: 38, maxHeight: 38)
            case .outOfMonth:
                Circle()
                    .stroke(style: .init())
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.black)
                    .frame(maxWidth: 38, maxHeight: 38)
            }
            
            Text(model.day)
                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 12))
                .foregroundColor(model.foregroundColor)
                .multilineTextAlignment(.center)
                .lineLimit(1)
        }
    }
}

struct DayOfMonthCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Colors.greenCustom.swiftUIColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                DayOfMonthCell(model: .init(state: .today,
                                            day: "31"))
                .previewLayout(.fixed(width: 53, height: 83))
                
                Divider()
                
                DayOfMonthCell(model: .init(state: .weekDay,
                                            day: "31"))
                .previewLayout(.fixed(width: 53, height: 83))
                
                Divider()
                
                DayOfMonthCell(model: .init(state: .outOfMonth,
                                            day: "31"))
                .previewLayout(.fixed(width: 53, height: 83))
            }
        }
    }
}
