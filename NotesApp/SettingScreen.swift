//
//  SettingScreen.swift
//  NotesApp
//
//  Created by BJIT on 14/10/26.
//

import SwiftUI

struct SettingScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var isPresented: Bool
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Toggle("Display count", isOn: $isPresented)
                Button {
                    isLoggedIn = false
                } label: {
                    Text("Logout")
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
    @Previewable @State var isPresented: Bool = true
    @Previewable @State var isLoggedIn: Bool = true
    SettingScreen(isPresented: $isPresented, isLoggedIn: $isLoggedIn)
}
