//
//  TitleTextFieldComponent.swift
//  DailyJournal
//
//  Created by Ani's Mac on 21.12.23.
//

import SwiftUI

struct TitleTextFieldComponent: View {
    @Binding var text: String
    var color: Color
    
    var body: some View {
        TextField("Title", text: $text)
            .frame(height: 36)
            .listRowBackground(color)
    }
}
