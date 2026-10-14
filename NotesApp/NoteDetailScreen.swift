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
        TextField(note.content, text: $note.content , axis: .vertical)
            .textFieldStyle(NoteTextFieldStyle())
            .navigationTitle("Edit note")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
   // NoteDetailScreen(noteViewModel: NoteViewModel())
}
