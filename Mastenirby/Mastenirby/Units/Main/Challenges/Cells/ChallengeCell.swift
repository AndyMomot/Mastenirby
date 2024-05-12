//
//  ChallengeCell.swift
//  Mastenirby
//
//  Created by Andrii Momot on 08.05.2024.
//

import SwiftUI

struct ChallengeCell: View {
    var item: ChallengeView.ChallengeModel
    var onAction: (Action) -> Void
    
    @State private var progress = 0.0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(item.dateCreated.toString(format: .ddMMyyyy))
                .foregroundStyle(.black)
                .font(Fonts.SFProDisplay.light.swiftUIFont(size: 12))
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(item.name)
                        .foregroundStyle(.black)
                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 17))
                    
                    Spacer()
                    
                    Text(item.deadlineText)
                        .foregroundStyle(Colors.greenCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 17))
                }
                
                Text(item.description)
                    .foregroundStyle(.black)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                    .lineLimit(1)
                
                HStack {
                    Text("Nagroda")
                        .foregroundStyle(.black)
                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 17))
                    
                    Spacer()
                    
                    Asset.starYellow.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .overlay {
                            Text("\(item.prize)")
                                .foregroundStyle(.black)
                                .font(Fonts.SFProDisplay.heavy.swiftUIFont(size: 10))
                        }
                }
                
                ProgressView(value: progress.clamped(to: 0.0...1.0))
                    .accentColor(Colors.greenCustom.swiftUIColor)
                    .frame(height: 7)
                
                if item.deadline != nil {
                    NextButtonView(
                        title: "Zakończ wcześniej",
                        color: Colors.redCustom.swiftUIColor) {
                            onAction(.finish)
                        }
                } else {
                    NextButtonView(
                        title: "Zaczynać") {
                            onAction(.start)
                        }
                }
            }
            .padding()
            .background(.white)
            .cornerRadius(15, corners: .allCorners)
            .onAppear {
                progress = item.progress
        }
        }
    }
}

extension ChallengeCell {
    enum Action {
        case start
        case finish
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.5)
            .ignoresSafeArea()
        
        ChallengeCell(item: .init(
            name: "Weekend bez ekranu",
            description: "Lorem ipsum dolor sit amet consectetur. Eget velit vitae nec dictum Massa Phasellus. Urna sem facilisis purus vitae sollicitudin praesent. Imperdiet vitae tellus aliquam porttitor justo. Enim at sed at duis adipiscing tellus ornare leo ut.",
            hours: 24,
            prize: 10)
        ) { _ in }
            .padding()
    }
}
