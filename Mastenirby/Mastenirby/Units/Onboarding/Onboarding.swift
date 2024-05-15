//
//  Onboarding.swift
//  Mastenirby
//
//  Created by Andrii Momot on 15.05.2024.
//

import SwiftUI

struct Onboarding: View {
    var item: Onboarding.OnboardingModel
    @Binding var currentPage: Int
    
    @EnvironmentObject var rootViewModel: RootContentView.RootContentViewModel
    @State private var isAgreed = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 38) {
            
            // Image
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
            
            VStack(spacing: 5) {
                
                // Segment indicator
                if let currentPage = item.currentPage {
                    let arrange = Array(0..<item.numberOfPages)
                    HStack(spacing: 5) {
                        ForEach(arrange, id: \.self) { index in
                            Asset.tabGreenBackground.swiftUIImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12)
                                .opacity(
                                    index == currentPage ? 1 : 0.3
                                )
                        }
                    }
                }
                
                // Title
                Text(item.title)
                    .foregroundStyle(.black)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 20))
                    .multilineTextAlignment(.center)
                
                // Subtitle
                Text(item.subtitle)
                    .foregroundStyle(.black)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 17))
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal)
            
            Spacer()
            
            VStack(spacing: 10) {
                NextButtonView(title: item.nextButtonTitle) {
                    if let currentPage = item.currentPage {
                        withAnimation {
                            self.currentPage = currentPage + 1
                        }
                    } else {
                        if isAgreed {
                            setIsAgreedStatus()
                        }
                    }
                }
                
                if let url = URL(string: item.urlString ?? "") {
                    CheckBoxView(text: "Zgadzam się z polityką prywatności",
                                 url: url) { selection in
                        isAgreed = selection
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

extension Onboarding {
    func setIsAgreedStatus() {
        DispatchQueue.main.async {
            DefaultsService.setAgreements(isAgreed: true)
            
            withAnimation {
                self.rootViewModel.isAgreed = DefaultsService.isAgreed
            }
        }
    }
}

extension Onboarding {
    struct OnboardingModel {
        var imageName: String
        var numberOfPages: Int
        var currentPage: Int?
        var title: String
        var subtitle: String
        var nextButtonTitle: String
        var urlString: String?
    }
}

#Preview {
    Onboarding(
        item: .init(
            imageName: Asset.onboarding1.name,
            numberOfPages: 2,
            currentPage: 0,
            title: "Witaj serdecznie w naszej aplikacji detoksu cyfrowego!",
            subtitle: "Tutaj znajdziesz wiele inspirujących aktywności i wskazówek, które pomogą Ci odkryć radość życia poza cyfrowym światem. Zapraszamy do eksploracji nowych doświadczeń i głębszego zanurzenia się w autentycznych chwilach.",
            nextButtonTitle: "Kontynuacja",
            urlString: "https://google.com"
        ), currentPage: .constant(0)
    )
}
