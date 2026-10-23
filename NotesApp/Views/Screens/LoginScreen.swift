//
//  LoginScreen.swift
//  NotesApp
//
//  Created by BJIT on 14/10/26.
//

import SwiftUI

struct LoginScreen: View {
    @State private var password: String = ""
    @State private var userName: String = ""
    @Bindable var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack(spacing: 20){
            TextField("UserName", text: $userName)
                .addTextFieldStyle()
                .keyboardType(.namePhonePad)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .textContentType(.username)
            
            SecureField("password", text: $password)
                .addTextFieldStyle()
                .textContentType(.password)
            Button {
                Task {
                    print(userName)
                    print(password)
                    await loginViewModel.login(userName: userName, password: password)
                }
            } label: {
                Text("Login now")
            }
            .padding(16)
            .buttonStyle(NoteButtonStyle(isFilled: true))
            .disabled(userName.count < 4 || password.count < 6)
        }
    }
}

#Preview {
    @Previewable @State var isLoggedIn: Bool = false
    
    LoginScreen(loginViewModel: LoginViewModel(authRepo: AuthRepoImpl(authService: AuthApi())))
}
