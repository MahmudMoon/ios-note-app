//
//  ContentView.swift
//  NotesApp
//
//  Created by BJIT on 13/10/26.
//

import SwiftUI

struct ContentView: View {
    @Bindable var noteViewModel: NoteViewModel
    @State private var showSettings: Bool = false
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                // Large note count
                if noteViewModel.showNoteCount { Text("\(noteViewModel.noteCount)")
                        .font(.system(size: 72, weight: .bold, design: .rounded))
                        .foregroundStyle(.cyan)
                    Text("notes")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                // TextField bound to draft via @Bindable in child
                NoteEditor(noteViewModel: noteViewModel)
                
                // Add / Reset buttons
                ButtonSection(noteViewModel: noteViewModel)
                
                switch noteViewModel.loadState {
                case .loading:
                    ProgressView("Loading notes…")
                        .tint(.cyan)
                case .failed(let error):
                    ErrorView(error: error) {
                        Task { await noteViewModel.refresh() }
                    }
                case .idle, .loaded:
                    EmptyView()
                }
                
                NoteListDisplay(noteViewModel: noteViewModel)
            }
            .navigationTitle(Text("Notes"))
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        showSettings = true
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .sheet(isPresented: $showSettings){
                SettingScreen(showNoteCount: $noteViewModel.showNoteCount, isLoggedIn: $isLoggedIn)
            }
            .padding(.all, 10)
            .task {
               await noteViewModel.loadIfNeeded()
            }
        }
        
    }
}


#Preview("Offline") {
    ContentView(
        noteViewModel: NoteViewModel(
            noteRepoLocal: InMemoryNoteRepoImp(), noteReportRemote: NoteFetchRepoImpl(noteService: NotesAPI())
        ),
        isLoggedIn: .constant(true)
    )
}

#Preview {
    @Previewable @State var isLoggedIn: Bool = true
    ContentView(noteViewModel: NoteViewModel(noteRepoLocal: InMemoryNoteRepoImp(notes: [
        Note(content: "Milkl"), Note(content: "Call Rahim")
    ]), noteReportRemote: NoteFetchRepoImpl(noteService: NotesAPI())),isLoggedIn: $isLoggedIn)
}
