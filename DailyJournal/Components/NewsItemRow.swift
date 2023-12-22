//
//  NewsItemRow.swift
//  DailyJournal
//
//  Created by Ani's Mac on 21.12.23.
//

import SwiftUI

struct NewsItemRow: View {
    let item: NewsItem
    @EnvironmentObject var viewModel: DailyNewsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(item.title)
                    .font(.system(size: 24, weight: .medium))
                
                Spacer()
                
                Image(systemName: "calendar")
                    .foregroundStyle(Color.customAccentColor)
                Text(viewModel.dateFormatter.string(from: item.date))
            }
            Text(item.content)
        }
        .listRowBackground(Color.customFormBackgroundColor)
    }
}
