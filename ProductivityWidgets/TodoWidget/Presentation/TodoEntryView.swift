//
//  TODOEntryView.swift
//  ProductivityWidgets
//
//  Created by Gabriel Amaral on 06/05/25.
//

import SwiftUI
import SwiftData


struct TodoEntryView : View {
    // A static descriptor: a @StateObject read in init isn't installed yet, so SwiftUI made a new
    // one on every init and warned about it.
    @Query(TodoEntryViewModel.todoFetchDescrpitor()) private var todos: [Todo]

    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            ForEach(todos) { todo in
                TodoWidgetRowView(todo: todo)
            }
            Spacer()
        }
        .containerBackground(.black, for: .widget)
        .padding(.horizontal, -10)
        .labelsHidden()
        .environment(\.colorScheme, .dark)
    }
}

