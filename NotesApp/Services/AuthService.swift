//
//  AuthService.swift
//  NotesApp
//
//  Created by BJIT on 23/10/26.
//

import Foundation

enum AuthError: LocalizedError {
    case invalidCredentials(String)
    case serverError
    case invalidResponse
    case unknown(statusCode: Int)

    var errorDescription: String? {
        switch self {
        case .invalidCredentials(let message):
            return message
        case .serverError:
            return "Server is unavailable. Please try again later."
        case .invalidResponse:
            return "Received an unexpected response from the server."
        case .unknown(let statusCode):
            return "Something went wrong (\(statusCode)). Please try again."
        }
    }
}

protocol AuthService {
    func login(username: String, password: String) async throws -> AuthRes
}

struct AuthApi: AuthService {
    
    func login(username: String, password: String) async throws -> AuthRes {
        
        var loginRequest = URLRequest(url: Constants.baseURL.appending(path: "auth/login"))
        
        let loginData = AuthReq(username: username, password: password)
        
        loginRequest.httpMethod = "POST"
        loginRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        loginRequest.httpBody = try JSONEncoder().encode(loginData)
        
        let (data, response) = try await URLSession.shared.data(for: loginRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw AuthError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            guard let authRes = try? JSONDecoder().decode(AuthRes.self, from: data) else {
                throw AuthError.invalidResponse
            }
            return authRes
        case 400, 401:
            let message = (try? JSONDecoder().decode(APIError.self, from: data))?.message
            throw AuthError.invalidCredentials(message ?? "Invalid username or password")
        case 500..<600:
            throw AuthError.serverError
        default:
            throw AuthError.unknown(statusCode: httpResponse.statusCode)
        }
    }
}
