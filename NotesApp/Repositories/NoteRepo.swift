//
//  NoteRepo.swift
//  NotesApp
//
//  Created by BJIT on 14/10/26.
//

import Foundation

protocol NoteRepo {
    func loadNotes() async throws -> [Note]
    func saveNotes(_ note: Note) async throws
    func updateNote(_ note: Note) async throws
}
