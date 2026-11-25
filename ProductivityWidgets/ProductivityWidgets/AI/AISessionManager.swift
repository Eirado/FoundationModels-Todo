//
//  AISessionManager.swift
//  ProductivityWidgets
//
//  Created by Gabriel Amaral on 01/07/25.
//

import Foundation
import FoundationModels
import Observation

public protocol AIModelProtocol {
    var session: LanguageModelSession { get }
    func prewarm() -> Void
}

@Observable
final class AISessionManager: AIModelProtocol {
    private let instructions: Instructions?
    
    private(set) var session: LanguageModelSession
    
    
    init(instructions: Instructions?) {
        self.instructions = instructions
        
        self.session = LanguageModelSession(instructions: self.instructions)
    }
    
    public func prewarm() {
        session.prewarm()
    }

    // A session keeps every prompt and answer in its transcript: reusing one fills the model's
    // context window and carries old goals into new lists, so each goal gets a new session.
    public func resetSession() {
        session = LanguageModelSession(instructions: instructions)
    }
}

public struct TaskInstruction {
    static let instruction: Instructions = Instructions {
        
            """
            
            You are an expert problem-solving assistant. Your sole purpose is to take a given problem or goal and break it down into a series of clear, actionable, and sequential tasks.

            - Provide the output as a numbered list.
            - Each task should be a single, clear action.
            - Each task must be a maximum of 3 lines long.
            - Do not add any conversational filler, greetings, or conclusions. Only output the task list.

            """
    }
}
