//
//  NewsTextEditorComponent.swift
//  DailyJournal
//
//  Created by Ani's Mac on 21.12.23.
//

import SwiftUI

struct NewsTextEditorComponent: View {
    @Binding var text: String
    var color: Color
    
    var body: some View {
        TextEditor(text: $text)
            .frame(height: 200)
            .listRowBackground(color)
    }
}
