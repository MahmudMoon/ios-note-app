//
//  ContentView.swift
//  NotesApp
//
//  Created by BJIT on 13/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var noteViewModel: NoteViewModel = NoteViewModel()
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
        }
        
    }
}

#Preview {
    @Previewable @State var isLoggedIn: Bool = true
    ContentView(isLoggedIn: $isLoggedIn)
}
