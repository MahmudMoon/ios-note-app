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
    
    init(authRepo: AuthRepository) {
        self.authRepo = authRepo
    }
    
    func login(userName: String, password: String) async {
       let authResult = await authRepo.login(username: userName, password: password)
       if let authResult = authResult {
            // user logged in
           isLoggedIn = true
           print(authResult)
       }else {
           // failed to login
          isLoggedIn = false
       }
    }
    
}
