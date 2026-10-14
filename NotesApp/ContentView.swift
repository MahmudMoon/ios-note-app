//
//  ContentView.swift
//  NotesApp
//
//  Created by BJIT on 13/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var noteViewModel: NoteViewModel = NoteViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                // Large note count
                Text("\(noteViewModel.noteCount)")
                    .font(.system(size: 72, weight: .bold, design: .rounded))
                    .foregroundStyle(.cyan)
                Text("notes")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                // TextField bound to draft via @Bindable in child
                NoteEditor(noteViewModel: noteViewModel)
                
                // Add / Reset buttons
                ButtonSection(noteViewModel: noteViewModel)
                
                NoteListDisplay(noteViewModel: noteViewModel)
            }
            .navigationTitle(Text("Notes"))
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        
                    } label: {
                        Image(systemName: "house")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .padding(.all, 10)
        }
        
    }
}

#Preview {
    ContentView()
}
