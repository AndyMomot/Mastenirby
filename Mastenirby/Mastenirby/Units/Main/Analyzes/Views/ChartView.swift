//
//  ChartView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 14.05.2024.
//

import SwiftUI
import Charts

struct ChartView: View {
    var type: ViewType
    var title: String
    var dataSource: [Date: Int]
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            HStack {
                Spacer()
                Text(title)
                    .foregroundStyle(.black)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 14))
                    .multilineTextAlignment(.center)
                Spacer()
            }
            
            Chart {
                ForEach(dataSource.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                    
                    var unit: Calendar.Component {
                        switch type {
                        case .day:
                            return .day
                        case .month:
                            return .month
                        }
                    }
                    
                    BarMark(
                        x: .value("Day", key, unit: unit),
                        y: .value("Amount", value)
                    )
                    .foregroundStyle(Colors.greenCustom.swiftUIColor)
                    .cornerRadius(10)
                }
            }
            .frame(maxHeight: 200)
            .chartYAxis(.hidden)
            .chartXAxis {
                AxisMarks(values: dataSource.map { $0.key }) { date in
                    
                    switch type {
                    case .day:
                        AxisValueLabel(format: .dateTime.weekday())
                    case .month:
                        AxisValueLabel(format: .dateTime.month())
                    }
                }
            }
            
            Divider()
        }
        .padding()
        .background(.white)
        .cornerRadius(15, corners: .allCorners)
        .shadow(radius: 2)
    }
}

#Preview {
    ZStack {
        Colors.transparentBackground.swiftUIColor
            .ignoresSafeArea()
        
        ChartView(
            type: .day,
            title: "Spędź tydzień na detoksie",
            dataSource: [
                Date().addOrSubtract(component: .day, value: -1): 100,
            Date(): 120,
                Date().addOrSubtract(component: .day, value: 1): 80
        ])
        .padding()
    }
}

extension ChartView {
    enum ViewType {
        case day
        case month
    }
}
