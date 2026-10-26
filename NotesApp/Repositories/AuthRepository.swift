//
//  AuthRepository.swift
//  NotesApp
//
//  Created by BJIT on 23/10/26.
//

import Foundation

protocol AuthRepository {
    func login(username: String, password: String) async throws -> AuthRes
}
