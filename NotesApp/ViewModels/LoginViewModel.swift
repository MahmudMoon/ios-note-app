//
//  LoginViewModel.swift
//  NotesApp
//
//  Created by BJIT on 23/10/26.
//

import Foundation

@MainActor
@Observable
final class LoginViewModel {
    
    private var authRepo: AuthRepository
    
    var isLoggedIn = false
    
    var loginFailed: Bool = false
    var failedMessage: String = "Invalid username or password"
    
    private(set) var token: AuthRes? = nil
    
    init(authRepo: AuthRepository) {
        self.authRepo = authRepo
    }
    
    func login(userName: String, password: String) async {
        do{
            let authResult = try await authRepo.login(username: userName, password: password)
            isLoggedIn = true
            token = authResult
            print(authResult)
        }catch {
            isLoggedIn = false
            loginFailed = true
            failedMessage = error.localizedDescription
            print(error)
        }
    }
    
    func logout(){
        isLoggedIn = false
        token = nil
    }
    
}
