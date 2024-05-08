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
            .init(title: "Jakie aktywności mogę wykonywać bez użycia gadżetów?",
                  description: "Odkryj świat aktywności niewymagających użycia urządzeń cyfrowych za pomocą naszej aplikacji podczas oszczędzania na swoją podróż lub wydarzenie specjalne. Bez względu na to, czy chodzi o eksplorację natury, próbowanie nowych hobby, czy uczestnictwo w doświadczeniach kulturalnych, nasza aplikacja oferuje porady, abyś mógł się bawić bez korzystania z ekranów."),
            
                .init(title: "Jakie aktywności mogę wykonywać bez użycia gadżetów?",
                      description: "Odkryj świat aktywności niewymagających użycia urządzeń cyfrowych za pomocą naszej aplikacji podczas oszczędzania na swoją podróż lub wydarzenie specjalne. Bez względu na to, czy chodzi o eksplorację natury, próbowanie nowych hobby, czy uczestnictwo w doświadczeniach kulturalnych, nasza aplikacja oferuje porady, abyś mógł się bawić bez korzystania z ekranów.")
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
