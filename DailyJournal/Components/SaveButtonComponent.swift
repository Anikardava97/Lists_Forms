//
//  SaveButtonComponent.swift
//  DailyJournal
//
//  Created by Ani's Mac on 21.12.23.
//

import SwiftUI

struct SaveButtonComponent: View {
    var action: () -> Void
    var text: String
    var foregroundColor: Color
    var isDisabled: Bool
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundColor(foregroundColor)
                .fontWeight(.medium)
                .padding(.horizontal, 12)
        }
        .disabled(isDisabled)
    }
}
