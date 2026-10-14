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
            .padding(.all, 12)
            .frame(maxWidth: 200, minHeight: 100, alignment: .topLeading)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.cyan, lineWidth: 2)
            }
            .padding(.all, 16)
    }
}
