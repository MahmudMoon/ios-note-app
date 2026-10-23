//
//  InMemoryNoteRepoImp.swift
//  NotesApp
//
//  Created by BJIT on 14/10/26.
//

import Foundation

final class InMemoryNoteRepoImp: NoteRepo {
    
    private var notes: [Note]
    
    init(notes: [Note] = []) {
        self.notes = notes
    }
    
    
    func loadNotes() async throws -> [Note] {
        return notes
    }
    
    func saveNotes(_ note: Note) async throws {
        print("saving note", notes)
        self.notes.append(note)
    }
    
    func updateNote(_ note: Note) async throws {
        guard let index = notes.firstIndex(where: { $0.id == note.id }) else { return }
        notes[index] = note
    }
}
