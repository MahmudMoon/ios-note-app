//
//  NoteEditor.swift
//  NotesApp
//
//  Created by BJIT on 13/10/26.
//

import SwiftUI

struct NoteEditor: View {
    @Bindable var noteViewModel: NoteViewModel

    var body: some View {
        TextField("Enter New Note", text: $noteViewModel.draft, axis: .vertical)
            .addTextFieldStyle()
    }
}

#Preview {
    NoteEditor(noteViewModel: NoteViewModel(noteRepoLocal: InMemoryNoteRepoImp(), noteReportRemote: NoteFetchRepoImpl(noteService: NotesAPI())))
}
