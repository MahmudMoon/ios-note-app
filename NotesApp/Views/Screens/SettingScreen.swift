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
    let logout: () -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Toggle("Display count", isOn: $showNoteCount)
                Button("Logout", role: .destructive){
                    dismiss()
                    logout()
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
    SettingScreen(showNoteCount: $showNoteCount, logout: {})
}
