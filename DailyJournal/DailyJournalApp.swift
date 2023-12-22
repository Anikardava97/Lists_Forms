//
//  DailyJournalApp.swift
//  DailyJournal
//
//  Created by Ani's Mac on 21.12.23.
//

import SwiftUI

@main
struct DailyJournalApp: App {
    @StateObject var viewModel = DailyNewsViewModel()
    
    var body: some Scene {
        WindowGroup {
            DailyNewsScene()
                .environmentObject(viewModel)
        }
    }
}
