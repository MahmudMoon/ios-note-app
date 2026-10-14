//
//  NoteViewModel.swift
//  NotesApp
//
//  Created by BJIT on 13/10/26.
//

import Foundation
import Observation

@Observable
class NoteViewModel {
    var notes: [String] = []
    var draft: String = ""

    var isDraftBlank: Bool {
        draft.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var noteCount: Int {
        notes.count
    }

    /// Adds the current draft to notes and clears it. Ignores blank drafts.
    func add() {
        let trimmed = draft.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        notes.append(trimmed)
        draft = ""
    }

    /// Removes all saved notes.
    func reset() {
        notes.removeAll()
    }
}
