//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by BJIT on 13/10/26.
//

import SwiftUI

@main
struct NotesAppApp: App {
    @State private var noteViewModel = NoteViewModel(
        noteRepoLocal: InMemoryNoteRepoImp(),
        noteReportRemote: NoteFetchRepoImpl(noteService: NotesAPI())
    )
    
    @State private var loginViewModel: LoginViewModel = LoginViewModel(
      authRepo: AuthRepoImpl(authService: AuthApi())
    )
    var body: some Scene {
        WindowGroup {
            if loginViewModel.isLoggedIn {
               // ContentView(noteViewModel: noteViewModel, isLoggedIn: $loginViewModel.isLoggedIn)
                ContentView(noteViewModel: noteViewModel, logout: {
                    loginViewModel.logout()
                })
            }else{
                LoginScreen(loginViewModel: loginViewModel)
            }
        }
    }
}
