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
                ForEach($noteViewModel.notes){ $note in
                    NavigationLink{
                        NoteDetailScreen(note: $note)
                    } label: {
                        Text(note.content)
                    }
                }
                
                .onDelete{ offset in
                    noteViewModel.delete(at: offset)
                }
        }
        .refreshable {
            await noteViewModel.refresh(showsLoading: false)
        }
    }
}

#Preview {
    NoteListDisplay(noteViewModel: NoteViewModel(noteRepo: InMemoryNoteRepoImp()))
}
