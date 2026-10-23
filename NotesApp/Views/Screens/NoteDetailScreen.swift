//
//  NoteDetailScreen.swift
//  NotesApp
//
//  Created by BJIT on 14/10/26.
//

import SwiftUI

struct NoteDetailScreen: View {
    let note: Note
    let onSave: (Note) -> Void
    @State private var content: String
    
    init(note: Note, onSave: @escaping (Note) -> Void) {
        self.note = note
        self.onSave = onSave
        _content = State(initialValue: note.content)
    }
    
    var body: some View {
        TextField("Enter your note", text: $content, axis: .vertical)
            .addTextFieldStyle()
            .frame(maxHeight: .infinity, alignment: .top)
            .navigationTitle("Edit note")
            .navigationBarTitleDisplayMode(.inline)
            .onDisappear {
                let trimmed = content.trimmingCharacters(in: .whitespacesAndNewlines)
                guard !trimmed.isEmpty, trimmed != note.content else { return }
                var updated = note
                updated.content = trimmed
                onSave(updated)
            }
    }
}

#Preview {
    NavigationStack {
        NoteDetailScreen(note: Note(content: "Milk")) { _ in }
    }
}
