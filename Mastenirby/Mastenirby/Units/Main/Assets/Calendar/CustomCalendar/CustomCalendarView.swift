//
//  CustomCalendarView.swift
//  TesejournerX
//
//  Created by Andrii Momot on 01.04.2024.
//

import SwiftUI

struct CustomCalendarView: View {
    
    @StateObject private var viewModel = CustomCalendarViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Colors.background.swiftUIColor
                .ignoresSafeArea()
            
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 35) {
                        
                        // Title
                        HStack {
                            Button {
                                dismiss.callAsFunction()
                            } label: {
                                HStack(spacing: 10) {
                                    Image(systemName: "chevron.left")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16)
                                    .foregroundStyle(.white)
                                    
                                    Text("Kalendarz")
                                        .foregroundStyle(.white)
                                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 25))
                                }                            }
                            
                            Spacer()
                        }
                        
                        // Month title
                        HStack {
                            Text(viewModel.date.toString(format: .llllYYYY).uppercased())
                                .foregroundStyle(.white)
                                .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 25))
                            Spacer()
                            
                            HStack(spacing: 20) {
                                Button {
                                    viewModel.addOrSubtractMonth(value: -1)
                                } label: {
                                    Image(systemName: "chevron.left")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16)
                                        .foregroundStyle(.white)
                                }
                                
                                Button {
                                    viewModel.addOrSubtractMonth(value: 1)
                                } label: {
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16)
                                        .foregroundStyle(.white)
                                    
                                }
                            }
                        }
                        
                        // Week days
                        HStack(spacing: 13) {
                            Spacer(minLength: 0)
                            ForEach(viewModel.weekDays, id: \.self) { day in
                                Text(day)
                                    .foregroundColor(.white)
                                    .font(Fonts.SFProDisplay.semibold.swiftUIFont(fixedSize: 17))
                                    .lineLimit(1)
                                Spacer(minLength: 0)
                            }
                        }
                        
                        // Calendar
                        VStack(alignment: .center, spacing: 12) {
                            ForEach(0..<viewModel.numberOfRows, id: \.self) { row in
                                HStack(alignment: .center, spacing: 14) {
                                    ForEach(0..<self.viewModel.daysInWeek, id: \.self) { column in
                                        if let date = viewModel.dayOfMonthFor(row: row, column: column).0 {
                                            let state = viewModel.dayOfMonthFor(row: row, column: column).1
                                            let model = viewModel.createDayModel(for: date, state: state)
                                            DayOfMonthCell(model: model)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Events
                    VStack(spacing: 10) {
                        ForEach(viewModel.events) { event in
                            CalendarEventCell(item: event) {
                                viewModel.delete(event: event)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
                .background(Colors.greenCustom.swiftUIColor)
                
                NextButtonView(title: "Utwórz przypomnienie") {
                    viewModel.showCreateEvent.toggle()
                }
                .padding()
            }
            
            if viewModel.showCreateEvent {
                CreateReminderView(show: $viewModel.showCreateEvent)
            }
        }
        .onAppear {
            viewModel.getCalendarEvents()
        }
        .onChange(of: viewModel.showCreateEvent, { oldValue, newValue in
            viewModel.getCalendarEvents()
        })
        .navigationBarBackButtonHidden()
    }
}

struct CustomCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCalendarView()
    }
}
