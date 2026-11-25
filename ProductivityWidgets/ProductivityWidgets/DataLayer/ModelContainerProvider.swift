//
//  ModelContainerProvider.swift
//  ProductivityWidgets
//
//  Created by Gabriel Amaral on 28/04/25.
//

import SwiftData
import Foundation

actor ModelContainerProvider {

    static let shared = ModelContainerProvider()

    // A let set once in init: a lazy var isn't thread-safe, and the widget's intent and its view
    // can reach it from different threads at the same time.
    nonisolated let modelContainer: ModelContainer

    private init() {
        do {
            modelContainer = try ModelContainer(for: Todo.self)
        } catch {
            fatalError("Failed to create the model container: \(error)")
        }
    }
}

