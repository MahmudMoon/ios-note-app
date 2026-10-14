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
    var notes: [Note] = []
    var draft: String = ""

    var isDraftBlank: Bool {
        draft.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var noteCount: Int {
        notes.count
    }

    /// Adds the current draft to notes and clears it. Ignores blank drafts.
    func add() {
        guard !isDraftBlank else { return }
        let trimmed = draft.trimmingCharacters(in: .whitespacesAndNewlines)
        notes.append(Note(content: trimmed))
        draft = ""
    }

    /// Removes all saved notes.
    func reset() {
        notes.removeAll()
    }
    
//    func getNote(uuid: UUID) -> Note? {
//        notes.filter{
//            $0.id == uuid
//        }.first
//    }
//    
//    func removeNote(uuid: UUID)-> Bool {
//        guard let _ = getNote(uuid: uuid) else {return false}
//        notes.removeAll(where: { $0.id == uuid })
//        return true
//    }
    
    func deletebasedonindex(index: Int) {
        notes.remove(at: index)
    }
}
