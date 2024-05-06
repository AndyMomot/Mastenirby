//
//  StepSliderView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 06.05.2024.
//

import SwiftUI

struct StepSlider: View {
    @Binding var value: Double
    
    var step: Double = 50
    var range: ClosedRange = 0...1_000.0
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: 2)
                
                Slider(value: Binding<Double>(
                        get: { self.value },
                        set: { self.value = round($0 / self.step) * self.step }
                ), in: range, step: step)
                .accentColor(Colors.greenCustom.swiftUIColor)
            }
        }
    }
}


#Preview {
    StepSlider(value: .constant(500))
}
