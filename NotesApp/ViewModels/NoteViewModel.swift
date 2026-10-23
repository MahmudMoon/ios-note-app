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
    private let noteRepoLocal: NoteRepo
    private let noteRepoRemote: NoteRepo
    
    var loadState: LoadState = .idle
    
    var notes: [Note] = []
    var draft: String = ""
    
    var showNoteCount: Bool = true
    
    private var hasLoaded = false

    var isDraftBlank: Bool {
        draft.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var noteCount: Int {
        notes.count
    }
    
    init(noteRepoLocal: NoteRepo, noteReportRemote: NoteRepo) {
        self.noteRepoLocal = noteRepoLocal
        self.noteRepoRemote = noteReportRemote
    }

    /// Adds the current draft to notes and clears it. Ignores blank drafts.
    func add() {
        guard !isDraftBlank else { return }
        let trimmed = draft.trimmingCharacters(in: .whitespacesAndNewlines)
        Task{
            let newNote = Note(content: trimmed)
            try await noteRepoLocal.saveNotes(newNote)
            notes.append(newNote)
        }
        draft = ""
    }

    /// Replaces the note with the same id and saves it to the repo it came from.
    func update(_ note: Note) {
        guard let index = notes.firstIndex(where: { $0.id == note.id }) else { return }
        notes[index] = note
        let repo = note.remoteID == nil ? noteRepoLocal : noteRepoRemote
        Task {
            do {
                try await repo.updateNote(note)
            } catch {
                print(error)
            }
        }
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
    
    /// Loads notes the first time the list appears. Coming back from a detail
    /// screen re-runs `.task`, and reloading then would throw away in-memory state.
    func loadIfNeeded() async {
        guard !hasLoaded else { return }
        hasLoaded = true
        await refresh()
    }
    
    /// Loads todos as notes. Pull to refresh passes `showsLoading: false` so the
    /// list's own refresh indicator isn't doubled up with the progress view.
    func refresh(showsLoading: Bool = true) async {
        loadState = showsLoading ? .loading : .idle
        do{
            let remoteNote =  try await noteRepoRemote.loadNotes()
            let localNote = try await noteRepoLocal.loadNotes()
            
            print("local notes: ")
            print(localNote)
            notes = localNote + remoteNote
            loadState = .loaded
        }catch {
            loadState = .failed(error.localizedDescription)
            print(error)
        }
    }
}
