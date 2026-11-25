//
//  GenerableTask.swift
//  ProductivityWidgets
//
//  Created by Gabriel Amaral on 23/06/25.
//

import FoundationModels

@available(iOS 26.0, *)

@Generable
struct GenerableTask {
    @Guide(description: "A TODO that can be marked as completed")
    let todoDescription: [String]
}
