//
//  DailyNewsScene.swift
//  DailyJournal
//
//  Created by Ani's Mac on 21.12.23.
//

import SwiftUI

struct DailyNewsScene: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = DailyNewsViewModel()
    
    private var accentColor = Color(red: 228/255, green: 175/255, blue: 9/255)
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("News List")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) { saveButton }
                    ToolbarItem(placement: .topBarLeading) { editButton }
                }
        }
    }
    // MARK: - Subviews
    private var content: some View {
        VStack {
            form
            
            if viewModel.newsItems.isEmpty {
                emptyStateView
            } else {
                newsListView
            }
        }
    }
    
    private var form: some View {
        Form {
            Section {
                TextField("Title", text: $viewModel.newsTitleTextField)
                TextEditor(text: $viewModel.newsTextEditor)
                    .frame(height: 100)
                DatePicker("Date", selection: $viewModel.newsDate, displayedComponents: .date)
            } header: {
                Text("News")
            }
        }
        .tint(accentColor)
    }
    
    private var emptyStateView: some View {
        Text("No News Added Yet")
            .foregroundStyle(accentColor)
    }
    
    private var newsListView: some View {
        List {
            ForEach(viewModel.newsItems, id: \.title) { item in
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text(item.title)
                            .font(.system(size: 24, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "calendar")
                            .foregroundStyle(accentColor)
                        Text(viewModel.dateFormatter.string(from: item.date))
                    }
                    Text(item.content)
                }
            }
            .onDelete(perform: viewModel.deleteNews)
            .onMove(perform: viewModel.moveNews)
        }
    }
    
    private var saveButton: some View {
        Button(action: {
            viewModel.saveNews()
        }, label: {
            Text("Save".uppercased())
                .foregroundColor(viewModel.textIsInserted() ? accentColor : Color.gray )
                .fontWeight(.medium)
                .padding(.horizontal, 12)
        })
        .disabled(!viewModel.textIsInserted())
    }
    
    private var editButton: some View {
        EditButton()
            .padding(.horizontal, 12)
            .foregroundStyle(accentColor)
    }
}

#Preview {
    DailyNewsScene()
}
