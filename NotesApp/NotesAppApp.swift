//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by BJIT on 13/10/26.
//

import SwiftUI

@main
struct NotesAppApp: App {
    @State private var isLoggedIn: Bool = false
    @State var noteViewModel = NoteViewModel(
        noteRepo: InMemoryNoteRepoImp()
    )
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView(noteViewModel: noteViewModel, isLoggedIn: $isLoggedIn)
            }else{
                LoginScreen(isLoggedIn: $isLoggedIn)
            }
        }
    }
}
