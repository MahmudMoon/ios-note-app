//
//  NoteDetailScreen.swift
//  NotesApp
//
//  Created by BJIT on 14/10/26.
//

import SwiftUI

struct NoteDetailScreen: View {
    @Binding var note: Note
    
    var body: some View {
        TextField("Enter your note", text: $note.content , axis: .vertical)
            .textFieldStyle(NoteTextFieldStyle())
            .navigationTitle("Edit note")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    @Previewable @State var note = Note(content: "Milk")
    NoteDetailScreen(note: $note)
}
