//
//  SettingScreen.swift
//  NotesApp
//
//  Created by BJIT on 14/10/26.
//

import SwiftUI

struct SettingScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var showNoteCount: Bool
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Toggle("Display count", isOn: $showNoteCount)
                Button("Logout", role: .destructive){
                    isLoggedIn = false
                }
            }
            .navigationTitle(Text("Setting"))
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var showNoteCount: Bool = true
    @Previewable @State var isLoggedIn: Bool = true
    SettingScreen(showNoteCount: $showNoteCount, isLoggedIn: $isLoggedIn)
}
