//
//  APIError.swift
//  NotesApp
//
//  Created by BJIT on 26/10/26.
//

import Foundation

/// Error body returned by the API, e.g. `{"message":"Invalid credentials"}`.
struct APIError: Decodable {
    let message: String
}
