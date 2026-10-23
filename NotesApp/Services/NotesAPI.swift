//
//  NotesAPI.swift
//  NotesApp
//
//  Created by BJIT on 15/10/26.
//

import Foundation

protocol NoteService {
    func fetchTodos() async throws -> [ToDo]
}

struct NotesAPI: NoteService {
    func fetchTodos() async throws -> [ToDo] {
        let url = Constants.baseURL
              .appending(path: "todos")
              .appending(queryItems: [URLQueryItem(name: "limit", value: "10")])
        
//        guard let url else {
//            throw URLError(.badURL)
//        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let todos = try JSONDecoder().decode(ToDoResponse.self, from: data).todos
        
        todos.forEach { todo in
            print(todo)
        }
        
        return todos
    }
}

struct PreviewNoteService: NoteService {
    var todos: [ToDo] = []
    var error: Error? = nil

    func fetchTodos() async throws -> [ToDo] {
        if let error { throw error }
        return todos
    }
}
