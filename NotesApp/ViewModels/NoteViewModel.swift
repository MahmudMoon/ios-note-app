//
//  NoteViewModel.swift
//  NotesApp
//
//  Created by BJIT on 13/10/26.
//

import Foundation
import Observation

enum LoadState {
    case idle
    case loading
    case loaded
    case failed(String)
    
}


@MainActor
@Observable
final class NoteViewModel {
    private let noteRepo: NoteRepo
    private var noteService: NoteService
    
    var loadState: LoadState = .idle
    
    var notes: [Note] {
        didSet { noteRepo.saveNotes(notes)}
    }
    var draft: String = ""
    
    var showNoteCount: Bool = true

    var isDraftBlank: Bool {
        draft.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var noteCount: Int {
        notes.count
    }
    
    init(noteRepo: NoteRepo, noteService: NoteService) {
        self.noteRepo = noteRepo
        self.notes = noteRepo.loadNotes()
        self.noteService = noteService
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
    
    func delete(at offset: IndexSet) {
        for index in offset.sorted(by: >) {
            notes.remove(at: index)
        }
    }
    
    /// Loads todos as notes. Pull to refresh passes `showsLoading: false` so the
    /// list's own refresh indicator isn't doubled up with the progress view.
    func refresh(showsLoading: Bool = true) async {
        loadState = showsLoading ? .loading : .idle
        do{
           let todos =  try await noteService.fetchTodos()
            let known = Set(notes.compactMap(\.remoteID))
            let newNotes = todos
                .filter { !known.contains($0.id) }
                .map { $0.toNote() }
            notes.append(contentsOf: newNotes)
            loadState = .loaded
        }catch {
            loadState = .failed(error.localizedDescription)
            print(error)
        }
    }
}
