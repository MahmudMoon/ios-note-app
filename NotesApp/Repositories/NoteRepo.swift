//
//  NoteRepo.swift
//  NotesApp
//
//  Created by BJIT on 14/10/26.
//

import Foundation

protocol NoteRepo {
    func loadNotes() -> [Note]
    func saveNotes(_ notes: [Note])
}
