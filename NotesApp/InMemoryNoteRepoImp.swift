//
//  InMemoryNoteRepoImp.swift
//  NotesApp
//
//  Created by BJIT on 14/10/26.
//

import Foundation

final class InMemoryNoteRepoImp: NoteRepo {
    
    var notes: [Note]
    
    init(notes: [Note] = []) {
        self.notes = notes
    }
    
    
    func loadNotes() -> [Note] {
        return notes
    }
    
    func saveNotes(_ notes: [Note]) {
        self.notes = notes
    }
}
