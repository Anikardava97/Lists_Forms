//
//  EditNewsScene.swift
//  DailyJournal
//
//  Created by Ani's Mac on 21.12.23.
//

import SwiftUI

struct EditNewsScene: View {
    @EnvironmentObject var viewModel: DailyNewsViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var path: NavigationPath
    var newsItemIndex: Int
    
    var body: some View {
        VStack {
            HStack {
                CustomBackButton(presentationMode: presentationMode, foregroundColor: .customAccentColor)
                    .padding(.horizontal, 16)
                Spacer()
            }
            .padding(.top, 8)
            
            Form {
                Section(header: Text("Edit News")) {
                    if viewModel.newsItems.indices.contains(newsItemIndex) {
                        TitleTextFieldComponent(text: $viewModel.newsItems[newsItemIndex].title, color: .customEditFormTitleFieldColor)
                        NewsTextEditorComponent(text: $viewModel.newsItems[newsItemIndex].content, color: .customEditFormBackgroundColor)
                        DatePickerComponent(selectedDate: $viewModel.newsItems[newsItemIndex].date, startingDate: viewModel.startingDate, endingDate: viewModel.endingDate, color: .customEditFormBackgroundColor)
                    } else {
                        Text("News item not found.")
                            .foregroundColor(.red)
                    }
                }
            }
            .background(Color.clear).scrollContentBackground(.hidden)
            .navigationBarBackButtonHidden()
        }
        .background(Color.clear)
    }
}

