//
//  DailyNewsScene.swift
//  DailyJournal
//
//  Created by Ani's Mac on 21.12.23.
//

import SwiftUI

struct DailyNewsScene: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: DailyNewsViewModel
    @State var path = NavigationPath()
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: $path) {
            content
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) { saveButton }
                    ToolbarItem(placement: .topBarLeading) { editButton }
                }
        }
    }
    // MARK: - Subviews
    private var content: some View {
        VStack(spacing: 0) {
            form
        }
        .background(Color.clear)
    }
    
    private var form: some View {
        Form {
            formSection
            newsListSection
        }
        .tint(Color.customAccentColor)
        .background(.gray.opacity(0.1))
        .scrollContentBackground(.hidden)
    }
    
    private var formSection: some View {
        Section {
            TitleTextFieldComponent(text: $viewModel.newsTitleTextField, color: Color.customTitleFieldColor)
            NewsTextEditorComponent(text:  $viewModel.newsTextEditor, color: Color.customFormBackgroundColor)
            DatePickerComponent(selectedDate: $viewModel.newsDate, startingDate: viewModel.startingDate, endingDate: viewModel.endingDate, color: Color.customFormBackgroundColor)
        } header: {
            Text("News")
        }
    }
    
    private var newsListSection: some View {
        Section {
            if viewModel.isNewsItemsEmpty {
                emptyStateView
            } else {
                newsListView
            }
        } header: {
            Text("News List")
        }
    }
    
    private var emptyStateView: some View {
        Text("No News Added Yet")
            .foregroundStyle(Color.customAccentColor)
    }
    
    private var newsListView: some View {
        List {
            ForEach(viewModel.newsItems.indices, id: \.self) { index in
                NavigationLink(value: index) {
                    NewsItemRow(item: viewModel.newsItems[index])
                }
                .navigationDestination(for: Int.self) { index in
                    EditNewsScene(path: $path, newsItemIndex: index)
                }
            }
            .onDelete(perform: viewModel.deleteNews)
            .onMove(perform: viewModel.moveNews)
        }
    }
    
    private var saveButton: some View {
        SaveButtonComponent(
            action: viewModel.saveNews,
            text: "Save",
            foregroundColor: Color.customAccentColor,
            isDisabled: !viewModel.textIsInserted())
    }
    
    private var editButton: some View {
        EditButton()
            .padding(.horizontal, 12)
            .foregroundStyle(Color.customAccentColor)
            .onTapGesture {
                viewModel.isEditingSheetPresented.toggle()
            }
    }
}

#Preview {
    DailyNewsScene()
        .environmentObject(DailyNewsViewModel())
}




