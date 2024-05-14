//
//  AnalyzesViewModelModel.swift
//  Mastenirby
//
//  Created by Andrii Momot on 14.05.2024.
//

import Foundation

extension AnalyzesView {
    final class AnalyzesViewModelModel: ObservableObject {
        @Published var detoxCostsCurrentWeek: [Date: Int] = [:]
        @Published var detoxCostsMonths: [Date: Int] = [:]
        
        func getAmountByWeekDay() {
            // Получаем начало текущей недели
            let startOfWeek = Date().startOfWeek
            
            // Фильтруем detoxCosts по текущей неделе
            let detoxCostsThisWeek = DefaultsService.getDetoxCosts().filter { $0.date.startOfWeek == startOfWeek }
            
            // Группируем по датам и вычисляем сумму amount для каждой даты
            var amountsByWeekDay = [Date: Int]()
            
            for detoxCost in detoxCostsThisWeek {
                let date = detoxCost.date
                amountsByWeekDay[date, default: 0] += detoxCost.amount
            }
            
            detoxCostsCurrentWeek = amountsByWeekDay
        }
        
        func getAmountByYear() {
            // Получаем начало текущей недели
            let currentYear = Calendar.current.component(.year, from: Date())
            
            // Фильтруем detoxCosts по текущей неделе
            let detoxCostsThisYear = DefaultsService.getDetoxCosts().filter { Calendar.current.component(.year, from: $0.date) == currentYear }
            
            // Группируем по датам и вычисляем сумму amount для каждой даты
            var amountsByWeekDay = [Date: Int]()
            
            for detoxCost in detoxCostsThisYear {
                let date = detoxCost.date
                amountsByWeekDay[date, default: 0] += detoxCost.amount
            }
            
            detoxCostsMonths = amountsByWeekDay
        }
        
        func onAppear() {
            getAmountByWeekDay()
            getAmountByYear()
        }
    }
}
