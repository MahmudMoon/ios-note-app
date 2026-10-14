//
//  LoginScreen.swift
//  NotesApp
//
//  Created by BJIT on 14/10/26.
//

import SwiftUI

struct LoginScreen: View {
    @Binding var isLoggedIn: Bool
    @State var password: String = ""
    @State var email: String = ""
    var body: some View {
        VStack(spacing: 20){
            TextField("Enter Email", text: $email)
                .addTextFieldStyle()
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .textContentType(.emailAddress)
            
            SecureField("userId", text: $password)
                .addTextFieldStyle()
                .textContentType(.password)
            Button {
                isLoggedIn = true
            } label: {
                Text("Login now")
            }
            .padding(16)
            .buttonStyle(NoteButtonStyle(isFilled: true))
            .disabled(!email.contains("@") || password.count < 6)
        }
    }
}

#Preview {
    @Previewable @State var isLoggedIn: Bool = false
    LoginScreen(isLoggedIn: $isLoggedIn)
}
