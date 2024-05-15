//
//  OnboardingViewTabView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 15.05.2024.
//

import SwiftUI

struct OnboardingViewTabView: View {
    private let numberOfTabs = 2
    @State private var currentPageIndex = 0
    
    var body: some View {
        TabView(selection: $currentPageIndex) {
            Onboarding(
                item: .init(
                    imageName: Asset.onboarding1.name,
                    numberOfPages: 2,
                    currentPage: 0,
                    title: "Witaj serdecznie w naszej aplikacji detoksu cyfrowego!",
                    subtitle: "Tutaj znajdziesz wiele inspirujących aktywności i wskazówek, które pomogą Ci odkryć radość życia poza cyfrowym światem. Zapraszamy do eksploracji nowych doświadczeń i głębszego zanurzenia się w autentycznych chwilach.",
                    nextButtonTitle: "Kontynuacja",
                    urlString: nil
                ), currentPage: $currentPageIndex
            )
            .tag(0)
            
            Onboarding(
                item: .init(
                    imageName: Asset.onboarding2.name,
                    numberOfPages: 2,
                    currentPage: 1,
                    title: "Jest to miejsce dla wszystkich, którzy pragną odzyskać równowagę między życiem online a offline!",
                    subtitle: " Oferujemy Ci narzędzia do odkrywania nowych pasji, miejsc i możliwości, aby doświadczyć pełniejszego życia bez nadmiernego wpływu technologii.",
                    nextButtonTitle: "Kontynuacja",
                    urlString: nil
                ), currentPage: $currentPageIndex
            )
            .tag(1)
            
            Onboarding(
                item: .init(
                    imageName: Asset.onboarding1.name,
                    numberOfPages: 2,
                    currentPage: nil,
                    title: "Witamy w Mastenirby",
                    subtitle: "Nasza polityka prywatności zapewnia ochronę danych osobowych użytkowników.",
                    nextButtonTitle: "Akceptuj",
                    urlString: "https://google.com"
                ), currentPage: $currentPageIndex
            )
            .tag(2)
        }
        .ignoresSafeArea(edges: .bottom)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .indexViewStyle(.page(backgroundDisplayMode: .never))
    }
}

#Preview {
    OnboardingViewTabView()
}
