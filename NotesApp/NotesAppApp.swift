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
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView(isLoggedIn: $isLoggedIn)
            }else{
                LoginScreen(isLoggedIn: $isLoggedIn)
            }
        }
    }
}
