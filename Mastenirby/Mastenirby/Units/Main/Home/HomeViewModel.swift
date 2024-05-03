//
//  HomeViewModel.swift
//  Mastenirby
//
//  Created by Andrii Momot on 03.05.2024.
//

import Foundation

extension HomeView {
    final class HomeViewModel: ObservableObject {
        
        let motivationItems: [MotivationItem] = [
            .init(image: Asset.motivation4.name,
                  text: "O krok od ekranu  \nAplikacja detoksu cyfrowego jest niezastąpionym towarzyszem w podróży ku nowym przeżyciom. Kiedy zbliżasz się do ekranu, zatrzymaj się na chwilę i skorzystaj z aplikacji, aby odkryć sposoby na delektowanie się chwilą bez nieustannego pochłaniania uwagi przez urządzenia elektroniczne. Dzięki niej możesz zachować swoje zasoby na tę niesamowitą przygodę i skoncentrować się na otaczającej rzeczywistości.\nOtwórz swoje umysłowe horyzonty, wykorzystując aplikację detoksu cyfrowego. To nie tylko narzędzie, ale także inspiracja do odkrywania nowych pomysłów i możliwości, pozostawiając w tyle szum cyfrowego świata. Stwórz własną wersję bezekranowej przygody, zainspirowaną przez aplikację, która pomoże Ci cieszyć się chwilą bez technologicznego rozpraszacza.\nZachęcamy do eksperymentowania z różnymi sposobami korzystania z aplikacji detoksu cyfrowego, aby lepiej zrozumieć, jakie doświadczenia sprawiają Ci największą radość i satysfakcję. Pamiętaj, że podróż bez ekranu może być nie tylko relaksem, ale też szansą na autentyczne odkrywanie siebie i otaczającego świata. Niech aplikacja stanie się Twoim przewodnikiem w tej inspirującej podróży, pozwalającą Ci korzystać z chwil bez ekranu w pełni i z pasją!\nOtwórz nowe horyzonty"),
            .init(image: Asset.motivation1.name,
                  text: "Aplikacja detoksu cyfrowego jest nieocenionym wsparciem w Twojej podróży ku nowym przeżyciom. To nie tylko narzędzie, ale także przyjaciel, który pomaga zachować zasoby na tę wyjątkową przygodę. Dzięki aplikacji odkryjesz, jak w pełni cieszyć się chwilą.\nZachęcamy do eksploracji nowych pomysłów i możliwości przy użyciu aplikacji detoksu cyfrowego. To więcej niż tylko technologiczne rozwiązanie - to przewodnik do odkrywania nieznanego, pozostawiając za sobą cyfrowy szum codzienności.\nOtwórz się na nowe doświadczenia i wykorzystaj czas bez ekranu jako okazję do autentycznych interakcji z otoczeniem. Pozwól aplikacji inspirować Cię i proponować unikalne sposoby na oderwanie się od cyfrowego świata. Przygotuj się na podróż przez nieznane, wypełnioną ekscytującymi możliwościami, które nie byłyby możliwe wirtualnie.\nPamiętaj, że detoks cyfrowy to nie tylko przerwa od urządzeń elektronicznych, ale także szansa na głębsze zanurzenie się w rzeczywistości. Aplikacja detoksu cyfrowego może być kluczem do pełniejszego życia poza ekranem, pomagając Ci rozwijać się i zdobywać nowe perspektywy.\nPodróżuj po świecie bez ekranu"),
            .init(image: Asset.motivation2.name, 
                  text: "Podróżowanie po świecie bez uzależnienia od ekranów otwiera drzwi do nowych perspektyw i autentycznych doświadczeń. Nasza aplikacja jest niezastąpionym narzędziem, które pomaga stworzyć budżet na różnorodne aktywności, a następnie proponuje kreatywne sposoby oderwania się od elektronicznych gadżetów.\nZapraszamy do odkrywania świata w pełni, korzystając z naszej aplikacji detoksu cyfrowego. Pozwól sobie na głębsze zanurzenie w podróży, ponieważ nasze pomysły pomogą Ci cieszyć się każdym momentem bez nieustannej obecności ekranów.\nCelem naszej aplikacji jest nie tylko zapewnienie praktycznych wskazówek, ale także inspiracja do eksploracji nowych miejsc i przeżyć. Zbliż się do kultury, przyrody i lokalnych społeczności bez zniekształceń cyfrowego świata. Pozwól sobie na pełne doświadczenie podróży, które nie będzie ograniczone przez technologię.\nPamiętaj, że podróżowanie bez ekranu to nie tylko sposób na odpoczynek od internetu, ale także szansa na autentyczne zanurzenie się w rzeczywistości. Odkrywaj nowe możliwości i poznawaj świat w sposób, który inspirowałby nawet najbardziej doświadczonych podróżników.\nPoszukiwanie nowych doświadczeń"),
            .init(image: Asset.motivation3.name,
                  text: "Poszukiwanie nowych doświadczeń staje się jeszcze bardziej ekscytujące dzięki naszej aplikacji detoksu cyfrowego. To narzędzie, które nie tylko pomaga Ci rozwijać się, badać i poznawać świat, ale także umożliwia zamianę zasobów na niezapomniane wrażenia.\nWraz z naszą aplikacją, możesz odkrywać nieznane obszary życia bez przeszkód ze strony elektronicznych urządzeń. Pozwól sobie na pełne zanurzenie w doświadczeniach, gdzie ekran nie będzie dominującym elementem.\nRozwijaj swoje zainteresowania i pasje, korzystając z propozycji aplikacji detoksu cyfrowego. Pozwól, aby każde przeżycie stało się inspiracją do dalszego rozwoju i poszukiwania nowych możliwości.\nPamiętaj, że wolność od cyfrowego kuszenia to nie tylko chwila oderwania od ekranów, ale prawdziwa podróż ku autentycznym doświadczeniom. Dzięki naszej aplikacji, możesz śmiało poszukiwać nowych przygód, nie obawiając się technologicznych ograniczeń.\nNiech poszukiwanie nowych doświadczeń stanie się dla Ciebie inspiracją do ciągłego rozwoju i otwierania się na świat w pełni, bez zakłóceń związanych z nadmiernym korzystaniem z urządzeń elektronicznych.")
        ]
        
    }
}

extension HomeView {
    struct MotivationItem: Identifiable, Hashable {
        private(set) var id = UUID()
        var image: String
        var text: String
    }
}
