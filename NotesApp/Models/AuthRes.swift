//
//  AuthRes.swift
//  NotesApp
//
//  Created by BJIT on 23/10/26.
//

import Foundation

struct AuthRes: Decodable {
    let accessToken: String
    let refreshToken: String
}
