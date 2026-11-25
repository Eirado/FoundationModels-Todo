//
//  ContentView.swift
//  ProductivityWidgets
//
//  Created by Gabriel Amaral on 24/04/25.
//

import SwiftUI

struct ContentView: View {
    // Built once here: built inside GeometryReader, a new view model and language model session
    // were made on every layout pass, then thrown away.
    @State private var viewModel = TodoViewFactory.makeViewModel(
        context: ModelContainerProvider.shared.modelContainer.mainContext
    )

    var body: some View {
        GeometryReader { geometry in
            TodoView(size: geometry.size, safeArea: geometry.safeAreaInsets, viewModel: viewModel)
        }
    }
}
