//
//  NoteListDisplay.swift
//  NotesApp
//
//  Created by BJIT on 14/10/26.
//

import SwiftUI

struct NoteListDisplay: View {
   @Bindable var noteViewModel: NoteViewModel
    
    var body: some View {
            List{
                ForEach(Array(noteViewModel.notes.enumerated()), id: \.element.id) { item in
                      let number = item.offset + 1      // position starts at 0, so add 1
                      let note = item.element

                      NavigationLink {
                          NoteDetailScreen(note: note) { updated in
                              noteViewModel.update(updated)
                          }
                      } label: {
                          HStack(alignment: .firstTextBaseline, spacing: 8) {
                              Text("\(number).")
                                  .foregroundStyle(.secondary)
                                  .monospacedDigit()
                              Text(note.content)
                          }
                      }
                  }
                  .onDelete { offsets in
                      noteViewModel.delete(at: offsets)
                  }
        }
        .refreshable {
            await noteViewModel.refresh(showsLoading: false)
        }
    }
}

#Preview {
    NoteListDisplay(noteViewModel: NoteViewModel(noteRepoLocal: InMemoryNoteRepoImp(), noteReportRemote: NoteFetchRepoImpl(noteService: NotesAPI())))
}
