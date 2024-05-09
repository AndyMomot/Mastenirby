//
//  ChallangeDetailsView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 09.05.2024.
//

import SwiftUI

struct ChallengeDetailsView: View {
    let item: ChallengeView.ChallengeModel
    var onCancel: () -> Void
    
    @State private var progress = 0.0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(spacing: 20) {
                Text(item.name)
                    .foregroundStyle(Colors.greenCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 17))
                Spacer()
                Asset.starYellow.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 38)
                    .overlay {
                        Text("\(item.prize)")
                            .foregroundStyle(Color.black)
                            .font(Fonts.SFProDisplay.heavy.swiftUIFont(size: 13))
                    }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Opis")
                    .foregroundStyle(Color.black)
                    .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 14))
                
                Text(item.description)
                    .foregroundStyle(Color.black)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
            }
            
            HStack(spacing: 20) {
                Text("Lewy")
                    .foregroundStyle(Color.black)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 15))
                Spacer()
                Text(item.deadlineText)
                    .foregroundStyle(Colors.greenCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 15))
            }
            
            ProgressView(value: progress.clamped(to: 0.0...1.0))
                .accentColor(Colors.greenCustom.swiftUIColor)
            
            NextButtonView(title: "Zamknąć",
                           color: Colors.redCustom.swiftUIColor) {
                onCancel()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20, corners: .allCorners)
        .onAppear {
            progress = item.progress
        }
    }
}

#Preview {
    ChallengeDetailsView(item: .init(
        name: "Weekend bez ekranu",
        description: "Lorem ipsum dolor sit amet consectetur. Eget velit vitae nec dictum Massa Phasellus. Urna sem facilisis purus vitae sollicitudin praesent. Imperdiet vitae tellus aliquam porttitor justo. Enim at sed at duis adipiscing tellus ornare leo ut.",
        hours: 6,
        prize: 25,
        deadline: .init().addOrSubtract(component: .hour, value: 3)
    )) {}
}
