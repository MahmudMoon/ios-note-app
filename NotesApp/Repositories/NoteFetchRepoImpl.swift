//
//  NoteFetchRepoImpl.swift
//  NotesApp
//
//  Created by BJIT on 23/10/26.
//

import Foundation

final class NoteFetchRepoImpl: NoteRepo {
    private let noteService: NoteService
    
    init(noteService: NoteService) {
        self.noteService = noteService
    }
    
    func loadNotes() async throws -> [Note] {
        let todos =  try await noteService.fetchTodos()
        return todos
            .map { $0.toNote() }
    }
    
    
    func saveNotes(_ note: Note) {
        print("We will save later on")
    }
    
    func updateNote(_ note: Note) {
        print("We will update later on")
    }
}
