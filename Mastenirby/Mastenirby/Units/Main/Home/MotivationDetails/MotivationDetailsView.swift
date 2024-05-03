//
//  MotivationDetailsView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 03.05.2024.
//

import SwiftUI

struct MotivationDetailsView: View {
    var item: HomeView.MotivationItem
    
    var body: some View {
        Text("Hello, World! \(item.image)")
    }
}

#Preview {
    MotivationDetailsView(item: .init(image: Asset.motivation4.name,
                                      text: "O krok od ekranu  \nAplikacja detoksu cyfrowego jest niezastąpionym towarzyszem w podróży ku nowym przeżyciom. Kiedy zbliżasz się do ekranu, zatrzymaj się na chwilę i skorzystaj z aplikacji, aby odkryć sposoby na delektowanie się chwilą bez nieustannego pochłaniania uwagi przez urządzenia elektroniczne. Dzięki niej możesz zachować swoje zasoby na tę niesamowitą przygodę i skoncentrować się na otaczającej rzeczywistości.\nOtwórz swoje umysłowe horyzonty, wykorzystując aplikację detoksu cyfrowego. To nie tylko narzędzie, ale także inspiracja do odkrywania nowych pomysłów i możliwości, pozostawiając w tyle szum cyfrowego świata. Stwórz własną wersję bezekranowej przygody, zainspirowaną przez aplikację, która pomoże Ci cieszyć się chwilą bez technologicznego rozpraszacza.\nZachęcamy do eksperymentowania z różnymi sposobami korzystania z aplikacji detoksu cyfrowego, aby lepiej zrozumieć, jakie doświadczenia sprawiają Ci największą radość i satysfakcję. Pamiętaj, że podróż bez ekranu może być nie tylko relaksem, ale też szansą na autentyczne odkrywanie siebie i otaczającego świata. Niech aplikacja stanie się Twoim przewodnikiem w tej inspirującej podróży, pozwalającą Ci korzystać z chwil bez ekranu w pełni i z pasją!\nOtwórz nowe horyzonty"))
}
