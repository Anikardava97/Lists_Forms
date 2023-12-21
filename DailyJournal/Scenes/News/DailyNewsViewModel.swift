//
//  DailyNewsViewModel.swift
//  DailyJournal
//
//  Created by Ani's Mac on 21.12.23.
//

import SwiftUI

final class DailyNewsViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var newsTitleTextField = ""
    @Published var newsTextEditor = ""
    @Published var newsDate = Date()
    @Published var newsItems: [NewsItem] = []
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    // MARK: - Functions
    func textIsInserted() -> Bool {
        return !newsTitleTextField.isEmpty
    }
    
    func saveNews() {
        let newNews = NewsItem(title: newsTitleTextField, content: newsTextEditor, date: newsDate)
        newsItems.append(newNews)
        clearForm()
    }
    
    func clearForm() {
        newsTitleTextField = ""
        newsTextEditor = ""
        newsDate = Date()
    }
    
    func deleteNews(at offsets: IndexSet) {
        newsItems.remove(atOffsets: offsets)
    }
    
    func moveNews(from source: IndexSet, to destination: Int) {
        newsItems.move(fromOffsets: source, toOffset: destination)
    }
}


