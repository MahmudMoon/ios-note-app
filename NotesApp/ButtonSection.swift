//
//  ButtonSection.swift
//  NotesApp
//
//  Created by BJIT on 13/10/26.
//

import SwiftUI
import Foundation

struct ButtonSection: View {
    @Bindable var noteViewModel: NoteViewModel

    var body: some View {
        HStack(spacing: 12) {
            Button {
                noteViewModel.add()
            } label: {
                Text("Add Note")
            }
            .disabled(noteViewModel.isDraftBlank)
            .buttonStyle(NoteButtonStyle(isFilled: true))

            Button {
                noteViewModel.reset()
            } label: {
                Text("Reset")
            }
            .disabled(noteViewModel.notes.isEmpty)
            .buttonStyle(NoteButtonStyle(isFilled: false))
        }
    }
}

#Preview {
    ButtonSection(noteViewModel: NoteViewModel())
}
