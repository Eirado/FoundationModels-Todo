//
//  TodoViewFactory.swift
//  ProductivityWidgets
//
//  Created by Gabriel Amaral on 28/04/25.
//

import SwiftData
import SwiftUI

@MainActor
final class TodoViewFactory {
    static public func makeTodoView(size: CGSize, safeArea: EdgeInsets, context: ModelContext) -> TodoView {
        TodoView(size: size, safeArea: safeArea, viewModel: makeViewModel(context: context))
    }

    static func makeViewModel(context: ModelContext) -> TodoViewModel {
        let repository = TodoRepository(context: context)
        return TodoViewModel(todoRepository: repository, modelContext: context) // Fixed: was "Mode"
    }
}
