//
//  NotesAPI.swift
//  NotesApp
//
//  Created by BJIT on 15/10/26.
//

import Foundation

struct NotesAPI{
    func fetchTodos() async throws -> [ToDo] {
        let url = URL(string: Constants.baseURL+Constants.endPoints)
        guard let url else {
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let todos = try JSONDecoder().decode(ToDoResponse.self, from: data).todos
        
        return todos
    }
}
