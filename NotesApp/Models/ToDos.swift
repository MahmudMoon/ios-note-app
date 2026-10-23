//
//  ToDos.swift
//  NotesApp
//
//  Created by BJIT on 15/10/26.
//

import Foundation

struct ToDoResponse: Decodable {
    let todos: [ToDo]
}

struct ToDo: Decodable {
    let id: Int
    let todo: String
    let completed: Bool
}

extension ToDo {
    func toNote() -> Note {
        Note(content: todo, remoteID: id)
    }
}
