//
//  AdviceViewModel.swift
//  Mastenirby
//
//  Created by Andrii Momot on 07.05.2024.
//

import Foundation

extension AdviceView {
    final class AdviceViewModel: ObservableObject {
        let adviсeItems: [AdviceModel] = [
            .init(title: "Jak mogę pozostać odłączony podczas mojej podróży?",
                  description: "Nasza aplikacja budżetowania detoksu cyfrowego może pomóc Ci pozostać zaangażowanym w aktywności bez ekranu podczas podróży lub wydarzeń. Oferuje wskazówki i sugestie dotyczące przyjemnych sposobów na odwrócenie uwagi od ekranów i odkrywania nowych zainteresowań podczas gromadzenia zasobów na swoje przygody."),
            
                .init(title: "Jakie aktywności mogę wykonywać bez użycia gadżetów?",
                      description: "Odkryj świat aktywności niewymagających użycia urządzeń cyfrowych za pomocą naszej aplikacji podczas oszczędzania na swoją podróż lub wydarzenie specjalne. Bez względu na to, czy chodzi o eksplorację natury, próbowanie nowych hobby, czy uczestnictwo w doświadczeniach kulturalnych, nasza aplikacja oferuje porady, abyś mógł się bawić bez korzystania z ekranów."),
            
                .init(title: "Jak najlepiej wykorzystać swoje chwile bez ekranu?",
                      description: "Podczas budżetowania na swoją podróż, nasza aplikacja detoksu cyfrowego oferuje cenne wskazówki, jak najlepiej wykorzystać czas bez ekranu. Naucz się cieszyć offlineowymi doświadczeniami, być w kontakcie ze swoim otoczeniem i cieszyć się znaczącymi interakcjami – wszystko podczas przygotowań do następnej przygody.")
        ]
    }
}

extension AdviceView {
    struct AdviceModel: Identifiable {
        private(set) var id = UUID()
        var title: String
        var description: String
    }
}
