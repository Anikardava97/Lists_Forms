//
//  DatePickerComponent.swift
//  DailyJournal
//
//  Created by Ani's Mac on 21.12.23.
//

import SwiftUI

struct DatePickerComponent: View {
    @Binding var selectedDate: Date
    var startingDate: Date
    var endingDate: Date
    var color: Color
    
    var body: some View {
        DatePicker("Date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: .date)
            .frame(height: 40)
            .listRowBackground(color)
    }
}
