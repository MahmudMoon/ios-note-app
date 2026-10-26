//
//  AuthRepoImpl.swift
//  NotesApp
//
//  Created by BJIT on 23/10/26.
//

import Foundation

final class AuthRepoImpl: AuthRepository {
    private var authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func login(username: String, password: String) async throws -> AuthRes {
        do{
            return try await authService.login(username: username, password: password)
        }catch {
            throw error
        }
    }
}
