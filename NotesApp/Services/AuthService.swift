//
//  AuthService.swift
//  NotesApp
//
//  Created by BJIT on 23/10/26.
//

import Foundation

enum AuthError: Error {
    case invalidCredentials
}

protocol AuthService {
    func login(username: String, password: String) async throws -> AuthRes
}

struct AuthApi: AuthService {
    
    func login(username: String, password: String) async throws -> AuthRes {
        
        var loginRequest = URLRequest(url: Constants.baseURL.appending(path: "auth/login"))
        
        let loginData = AuthReq(username: username, password: password)
        
        loginRequest.httpMethod = "POST"
        loginRequest.setValue("application/json", forHTTPHeaderField: "content-Type")
        
        loginRequest.httpBody = try JSONEncoder().encode(loginData)
        
        let (data, response) = try await URLSession.shared.data(for: loginRequest)
        
        print(response)
        print(data)
        
        guard let responseStatus = response as? HTTPURLResponse, (200...300).contains(responseStatus.statusCode) else {
            throw AuthError.invalidCredentials
        }
        
        let authRes = try? JSONDecoder().decode(AuthRes.self, from: data)
         
        return authRes ?? AuthRes(accessToken: "", refreshToken: "")
    }
}
