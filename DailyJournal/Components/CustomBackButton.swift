//
//  CustomBackButton.swift
//  DailyJournal
//
//  Created by Ani's Mac on 21.12.23.
//

import SwiftUI

struct CustomBackButton: View {
    @Binding var presentationMode: PresentationMode
    var foregroundColor: Color
    
    var body: some View {
        Button(action: {
            presentationMode.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(foregroundColor)
                Text("Save")
                    .foregroundColor(foregroundColor)
            }
        }
    }
}
